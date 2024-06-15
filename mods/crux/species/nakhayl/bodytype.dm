/datum/appearance_descriptor/age/nakhayl
	standalone_value_descriptors = list(
		"an infant"     = 1,
		"a toddler"     = 3,
		"a child"       = 7,
		"an adolescent" = 13,
		"a young adult" = 18,
		"an adult"      = 30,
		"middle-aged"   = 55,
		"aging"         = 80,
		"elderly"       = 140
	)

/decl/bodytype/nakhayl
	name                 = "humanoid"
	bodytype_category    = BODYTYPE_GNOLL
	limb_blend           = ICON_MULTIPLY
	icon_template        = 'mods/crux/icons/species/nakhayl/template.dmi'
	icon_base            = 'mods/crux/icons/species/nakhayl/body.dmi'
	icon_deformed        = 'mods/crux/icons/species/nakhayl/deformed_body.dmi'
	bandages_icon        = 'icons/mob/bandage.dmi'
	eye_icon             = 'mods/crux/icons/species/nakhayl/eyes.dmi'
	cosmetics_icon       = 'mods/crux/icons/species/nakhayl/cosmetics.dmi'
	health_hud_intensity = 1.75
	bodytype_flag        = BODY_FLAG_GNOLL
	appearance_flags     = HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR
	base_color           = "#ae7d32"
	base_eye_color       = "#00aa00"
	age_descriptor         = /datum/appearance_descriptor/age/nakhayl

	default_sprite_accessories = list(
		SAC_HAIR = list(
			/decl/sprite_accessory/hair/nakhayl/mohawk        = "#46321c"
		),
		SAC_MARKINGS = list(
			/decl/sprite_accessory/marking/nakhayl/belly      = "#b6b0a8",
			/decl/sprite_accessory/marking/nakhayl/spots/body = "#1b1207",
			/decl/sprite_accessory/marking/nakhayl/ears       = "#1b1207"
		)
	)

	eye_darksight_range                   = 7
	eye_flash_mod                         = 2
	eye_blend                             = ICON_MULTIPLY
	eye_low_light_vision_effectiveness    = 0.15
	eye_low_light_vision_adjustment_speed = 0.3

	override_limb_types = list(
		BP_TAIL = /obj/item/organ/external/tail/nakhayl
	)


	cold_level_1 = 200
	cold_level_2 = 140
	cold_level_3 = 80

	heat_level_1 = 330
	heat_level_2 = 380
	heat_level_3 = 800

	heat_discomfort_level = 294
	cold_discomfort_level = 230
	heat_discomfort_strings = list(
		"Your fur prickles in the heat.",
		"You feel uncomfortably warm.",
		"Your overheated skin itches."
	)

/decl/bodytype/nakhayl/Initialize()
	equip_adjust = list(
		slot_glasses_str =   list("[NORTH]" = list(0, 2), "[EAST]" = list(0, 2), "[SOUTH]" = list( 0, 2),  "[WEST]" = list(0, 2)),
		slot_wear_mask_str = list("[NORTH]" = list(0, 2), "[EAST]" = list(0, 2), "[SOUTH]" = list( 0, 2),  "[WEST]" = list(0, 2)),
		slot_head_str =      list("[NORTH]" = list(0, 2), "[EAST]" = list(0, 2), "[SOUTH]" = list( 0, 2),  "[WEST]" = list(0, 2))
	)
	. = ..()
