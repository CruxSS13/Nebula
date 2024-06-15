/decl/species/nakhayl
	name                   = SPECIES_NAKHAYL
	name_plural            = "Ha-Nakhay"
	base_external_prosthetics_model = null
	description            = "Gnolls!"
	hidden_from_codex      = FALSE
	available_bodytypes    = list(/decl/bodytype/nakhayl)
	preview_outfit         = /decl/hierarchy/outfit/job/generic/engineer
	spawn_flags            = SPECIES_CAN_JOIN
	flesh_color            = "#ae7d32"
	hunger_factor          = DEFAULT_HUNGER_FACTOR * 1.2
	gluttonous             = GLUT_TINY
	move_trail             = /obj/effect/decal/cleanable/blood/tracks/paw

	unarmed_attacks = list(
		/decl/natural_attack/stomp,
		/decl/natural_attack/kick,
		/decl/natural_attack/punch,
		/decl/natural_attack/bite/sharp
	)

	available_cultural_info = list(
		TAG_HOMEWORLD = list(
			/decl/cultural_info/location/crux/nakhayl,
			/decl/cultural_info/location/crux,
			/decl/cultural_info/location/other
		),
		TAG_FACTION =   list(
			/decl/cultural_info/faction/crux/nakhayl,
			/decl/cultural_info/faction/crux,
			/decl/cultural_info/faction/other
		),
		TAG_CULTURE =   list(
			/decl/cultural_info/culture/crux/nakhayl,
			/decl/cultural_info/culture/crux,
			/decl/cultural_info/culture/other
		),
		TAG_RELIGION =  list(
			/decl/cultural_info/religion/other
		)
	)

	default_emotes = list(
		/decl/emote/visible/tail/swish,
		/decl/emote/visible/tail/wag,
		/decl/emote/visible/tail/sway,
		/decl/emote/visible/tail/qwag,
		/decl/emote/visible/tail/fastsway,
		/decl/emote/visible/tail/swag,
		/decl/emote/visible/tail/stopsway
	)

/decl/species/nakhayl/handle_additional_hair_loss(var/mob/living/carbon/human/H, var/defer_body_update = TRUE)
	. = H?.set_skin_colour(rgb(189, 171, 143))
