/obj/item/card/id/syndicate
	assignment = "Agent"
	origin_tech = @'{"esoteric":3}'
	var/electronic_warfare = 1
	var/mob/registered_user = null
	color = COLOR_GRAY40
	detail_color = COLOR_NT_RED
	var/static/list/base_access = list(
		access_maint_tunnels,
		access_hacked,
		access_external_airlocks
	)

/obj/item/card/id/syndicate/Initialize()
	. = ..()
	access = base_access.Copy()

/obj/item/card/id/syndicate/station_access/Initialize()
	. = ..() // Same as the normal Syndicate id, only already has all station access
	access |= get_all_station_access()

/obj/item/card/id/syndicate/Destroy()
	unset_registered_user(registered_user)
	return ..()

/obj/item/card/id/syndicate/prevent_tracking()
	return electronic_warfare

/obj/item/card/id/syndicate/afterattack(var/obj/item/O, mob/user, proximity)
	if(!proximity) return
	if(istype(O, /obj/item/card/id))
		var/obj/item/card/id/I = O
		src.access |= I.access
		if(player_is_antag(user.mind))
			to_chat(user, "<span class='notice'>The microscanner activates as you pass it over the ID, copying its access.</span>")

/obj/item/card/id/syndicate/attack_self(mob/user)
	// We use the fact that registered_name is not unset should the owner be vaporized, to ensure the id doesn't magically become unlocked.
	if(!registered_user && register_user(user))
		to_chat(user, "<span class='notice'>The microscanner marks you as its owner, preventing others from accessing its internals.</span>")
	if(registered_user == user)
		switch(alert("Would you like edit the ID, or show it?","Show or Edit?", "Edit","Show"))
			if("Edit")
				ui_interact(user)
			if("Show")
				..()
	else
		..()

/obj/item/card/id/syndicate/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1)
	var/data[0]
	var/entries[0]
	entries[++entries.len] = list("name" = "Age", 				"value" = age)
	entries[++entries.len] = list("name" = "Prefix", 			"value" = formal_name_prefix)
	entries[++entries.len] = list("name" = "Suffix", 			"value" = formal_name_suffix)
	entries[++entries.len] = list("name" = "Appearance",		"value" = "Set")
	entries[++entries.len] = list("name" = "Assignment",		"value" = assignment)
	if(global.using_map.flags & MAP_HAS_BRANCH)
		entries[++entries.len] = list("name" = "Branch",		"value" = military_branch ? military_branch.name : "N/A")
	if(military_branch && (global.using_map.flags & MAP_HAS_RANK))
		entries[++entries.len] = list("name" = "Rank",			"value" = military_rank ? military_rank.name : "N/A")
	entries[++entries.len] = list("name" = "Blood Type",		"value" = blood_type)
	entries[++entries.len] = list("name" = "DNA Hash", 			"value" = dna_hash)
	entries[++entries.len] = list("name" = "Fingerprint Hash",	"value" = fingerprint_hash)
	entries[++entries.len] = list("name" = "Name", 				"value" = registered_name)
	entries[++entries.len] = list("name" = "Photo", 			"value" = "Update")
	entries[++entries.len] = list("name" = "Gender", 				"value" = card_gender)
	entries[++entries.len] = list("name" = "Factory Reset",		"value" = "Use With Care")
	data["electronic_warfare"] = electronic_warfare
	data["entries"] = entries

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "agent_id_card.tmpl", "Agent id", 600, 400)
		ui.set_initial_data(data)
		ui.open()

/obj/item/card/id/syndicate/proc/register_user(var/mob/user)
	if(!istype(user) || user == registered_user)
		return FALSE
	unset_registered_user()
	registered_user = user
	user.set_id_info(src)
	events_repository.register(/decl/observ/destroyed, user, src, TYPE_PROC_REF(/obj/item/card/id/syndicate, unset_registered_user))
	return TRUE

/obj/item/card/id/syndicate/proc/unset_registered_user(var/mob/user)
	if(!registered_user || (user && user != registered_user))
		return
	events_repository.unregister(/decl/observ/destroyed, registered_user, src)
	registered_user = null

/obj/item/card/id/syndicate/CanUseTopic(var/mob/user, var/datum/topic_state/state, var/href_list)
	if(!(href_list && href_list["look_at_id"]) && (user != registered_user))
		return STATUS_CLOSE
	return ..()

/obj/item/card/id/syndicate/Topic(href, href_list, var/datum/topic_state/state)
	if(..())
		return 1

	var/mob/user = usr
	if(href_list["electronic_warfare"])
		electronic_warfare = text2num(href_list["electronic_warfare"])
		to_chat(user, "<span class='notice'>Electronic warfare [electronic_warfare ? "enabled" : "disabled"].</span>")
	else if(href_list["set"])
		switch(href_list["set"])
			if("Age")
				var/new_age = input(user,"What age would you like to put on this card?","Agent Card Age", age) as null|num
				if(!isnull(new_age) && CanUseTopic(user, state))
					if(new_age < 0)
						age = initial(age)
					else
						age = new_age
					to_chat(user, "<span class='notice'>Age has been set to '[age]'.</span>")
					. = 1
			if("Prefix")
				var/new_prefix = sanitize_safe(input(user,"What title prefix would you like to put on this card?","Agent Card Prefix", age) as text, MAX_NAME_LEN)
				if(!isnull(new_prefix) && CanUseTopic(user, state))
					formal_name_prefix = new_prefix
					to_chat(user, "<span class='notice'>Title prefix has been set to '[formal_name_prefix]'.</span>")
					. = 1
			if("Suffix")
				var/new_suffix = sanitize_safe(input(user,"What title suffix would you like to put on this card?","Agent Card Suffix", age) as text, MAX_NAME_LEN)
				if(!isnull(new_suffix) && CanUseTopic(user, state))
					formal_name_suffix = new_suffix
					to_chat(user, "<span class='notice'>Title suffix has been set to '[formal_name_suffix]'.</span>")
					. = 1
			if("Appearance")
				var/datum/card_state/choice = input(user, "Select the appearance for this card.", "Agent Card Appearance") as null|anything in id_card_states()
				if(choice && CanUseTopic(user, state))
					src.icon_state = choice.icon_state
					src.item_state = choice.item_state
					src.color = choice.color
					src.detail_color = choice.detail_color
					src.extra_details = choice.extra_details
					update_icon()
					to_chat(usr, "<span class='notice'>Appearance changed to [choice].</span>")
					. = 1
			if("Assignment")
				var/new_job = sanitize(input(user,"What assignment would you like to put on this card?\nChanging assignment will not grant or remove any access levels.","Agent Card Assignment", assignment) as null|text)
				if(!isnull(new_job) && CanUseTopic(user, state))
					src.assignment = new_job
					to_chat(user, "<span class='notice'>Occupation changed to '[new_job]'.</span>")
					. = 1
			if("Blood Type")
				var/default = blood_type
				if(default == initial(blood_type) && ishuman(user))
					default = user.get_blood_type()
				var/new_blood_type = sanitize(input(user,"What blood type would you like to be written on this card?","Agent Card Blood Type",default) as null|text)
				if(!isnull(new_blood_type) && CanUseTopic(user, state))
					src.blood_type = new_blood_type
					to_chat(user, "<span class='notice'>Blood type changed to '[new_blood_type]'.</span>")
					. = 1
			if("DNA Hash")
				var/default = dna_hash
				if(default == initial(dna_hash) && ishuman(user))
					var/mob/living/human/H = user
					var/unique_enzymes = H.get_unique_enzymes()
					if(unique_enzymes)
						default = unique_enzymes
				var/new_dna_hash = sanitize(input(user,"What DNA hash would you like to be written on this card?","Agent Card DNA Hash",default) as null|text)
				if(!isnull(new_dna_hash) && CanUseTopic(user, state))
					src.dna_hash = new_dna_hash
					to_chat(user, "<span class='notice'>DNA hash changed to '[new_dna_hash]'.</span>")
					. = 1
			if("Fingerprint Hash")
				var/default = fingerprint_hash
				if(default == initial(fingerprint_hash) && ishuman(user))
					var/mob/living/human/H = user
					default = H.get_full_print(ignore_blockers = TRUE)
				var/new_fingerprint_hash = sanitize(input(user,"What fingerprint hash would you like to be written on this card?","Agent Card Fingerprint Hash",default) as null|text)
				if(!isnull(new_fingerprint_hash) && CanUseTopic(user, state))
					src.fingerprint_hash = new_fingerprint_hash
					to_chat(user, "<span class='notice'>Fingerprint hash changed to '[new_fingerprint_hash]'.</span>")
					. = 1
			if("Name")
				var/new_name = sanitize_name(input(user,"What name would you like to put on this card?","Agent Card Name", registered_name) as null|text, allow_numbers=TRUE)
				if(!isnull(new_name) && CanUseTopic(user, state))
					src.registered_name = new_name
					to_chat(user, "<span class='notice'>Name changed to '[new_name]'.</span>")
					. = 1
			if("Photo")
				set_id_photo(user)
				to_chat(user, "<span class='notice'>Photo changed.</span>")
				. = 1
			if("Gender")
				var/new_gender = sanitize(input(user,"What gender would you like to put on this card?","Agent Card Gender", card_gender) as null|text)
				if(!isnull(new_gender) && CanUseTopic(user, state))
					src.card_gender = new_gender
					to_chat(user, "<span class='notice'>Gender changed to '[new_gender]'.</span>")
					. = 1
			if("Factory Reset")
				if(alert("This will factory reset the card, including access and owner. Continue?", "Factory Reset", "No", "Yes") == "Yes" && CanUseTopic(user, state))
					age = initial(age)
					formal_name_prefix = initial(formal_name_prefix)
					formal_name_suffix = initial(formal_name_suffix)
					access = base_access.Copy()
					assignment = initial(assignment)
					blood_type = initial(blood_type)
					dna_hash = initial(dna_hash)
					electronic_warfare = initial(electronic_warfare)
					fingerprint_hash = initial(fingerprint_hash)
					icon_state = initial(icon_state)
					color = initial(color)
					detail_color = initial(detail_color)
					extra_details = initial(extra_details)
					SetName(initial(name))
					registered_name = initial(registered_name)
					unset_registered_user()
					card_gender = initial(card_gender)
					military_branch = initial(military_branch)
					military_rank = initial(military_rank)
					to_chat(user, "<span class='notice'>All information has been deleted from \the [src].</span>")
					. = 1
			if("Branch")
				var/new_branch = sanitize(input(user,"What branch of service would you like to put on this card?","Agent Card Branch") as null|anything in mil_branches.spawn_branches())
				if(!isnull(new_branch) && CanUseTopic(user, state))
					src.military_branch =  mil_branches.spawn_branches()[new_branch]
					to_chat(user, "<span class='notice'>Branch changed to '[military_branch.name]'.</span>")
					. = 1
			if("Rank")
				var/new_rank = sanitize(input(user,"What rank would you like to put on this card?","Agent Card Rank") as null|anything in mil_branches.spawn_ranks(military_branch.name))
				if(!isnull(new_rank) && CanUseTopic(user, state))
					src.military_rank = mil_branches.spawn_ranks(military_branch.name)[new_rank]
					to_chat(user, "<span class='notice'>Rank changed to '[military_rank.name]'.</span>")
					. = 1

	// Always update the UI, or buttons will spin indefinitely
	SSnano.update_uis(src)

var/global/list/id_card_states
/proc/id_card_states()
	if(!id_card_states)
		id_card_states = list()
		for(var/path in typesof(/obj/item/card/id))
			var/obj/item/card/id/ID = path
			var/datum/card_state/CS = new()
			CS.icon_state = initial(ID.icon_state)
			CS.item_state = initial(ID.item_state)
			CS.color = initial(ID.color)
			CS.detail_color = initial(ID.detail_color)
			CS.extra_details = initial(ID.extra_details)
			CS.name = initial(ID.name) + " - " + initial(ID.icon_state)
			var/color_pair = ""
			if(CS.color)
				color_pair += CS.color
			if(CS.detail_color)
				color_pair += "/[CS.detail_color]"
			if(color_pair)
				CS.name += " - [color_pair]"
			id_card_states += CS
		id_card_states = dd_sortedObjectList(id_card_states)

	return id_card_states

/datum/card_state
	var/name
	var/icon_state
	var/item_state
	var/color
	var/detail_color
	var/extra_details

/datum/card_state/dd_SortValue()
	return name
