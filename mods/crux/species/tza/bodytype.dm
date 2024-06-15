/datum/appearance_descriptor/age/tza
	chargen_min_index = 3
	chargen_max_index = 6
	standalone_value_descriptors = list(
		"a larva"        = 1,
		"a nymph"        = 2,
		"a juvenile"     = 3,
		"an adolescent"  = 5,
		"a young adult"  = 12,
		"a full adult"   = 20,
		"senescent"      = 35
	)

/decl/bodytype/tza
	name = "mantid worker"
	bodytype_category = BODYTYPE_TZA
	icon_base         = 'mods/crux/icons/species/tza/body.dmi'
	blood_overlays    = 'mods/crux/icons/species/tza/blood_overlays.dmi'
	associated_gender = FEMALE
	bodytype_flag     = BODY_FLAG_TZA
	movement_slowdown = -1
	limb_blend        = ICON_MULTIPLY
	appearance_flags  = HAS_EYE_COLOR | HAS_SKIN_COLOR
	base_color        = COLOR_SILVER
	base_eye_color    = COLOR_SABER_AXE
	age_descriptor    = /datum/appearance_descriptor/age/tza
	appearance_descriptors = list(
		/datum/appearance_descriptor/height      = 0.8,
		/datum/appearance_descriptor/body_length = 0.6
	)

	default_sprite_accessories = list(
		SAC_MARKINGS = list(
			/decl/sprite_accessory/marking/tza/highlights = COLOR_PALE_PINK
		)
	)

	has_limbs = list(
		BP_CHEST =  list("path" = /obj/item/organ/external/chest/insectoid),
		BP_GROIN =  list("path" = /obj/item/organ/external/groin/insectoid),
		BP_HEAD =   list("path" = /obj/item/organ/external/head/insectoid),
		BP_L_ARM =  list("path" = /obj/item/organ/external/arm/insectoid),
		BP_L_HAND = list("path" = /obj/item/organ/external/hand/insectoid),
		BP_R_ARM =  list("path" = /obj/item/organ/external/arm/right/insectoid),
		BP_R_HAND = list("path" = /obj/item/organ/external/hand/right/insectoid),
		BP_M_ARM =  list("path" = /obj/item/organ/external/arm/insectoid/tza_midlimb),
		BP_M_HAND = list("path" = /obj/item/organ/external/hand/insectoid/tza_midlimb),
		BP_L_LEG =  list("path" = /obj/item/organ/external/leg/insectoid),
		BP_L_FOOT = list("path" = /obj/item/organ/external/foot/insectoid),
		BP_R_LEG =  list("path" = /obj/item/organ/external/leg/right/insectoid),
		BP_R_FOOT = list("path" = /obj/item/organ/external/foot/right/insectoid),
		BP_M_LEG =  list("path" = /obj/item/organ/external/leg/insectoid/tza_midlimb),
		BP_M_FOOT = list("path" = /obj/item/organ/external/foot/insectoid/tza_midlimb),
		BP_TAIL   = list("path" = /obj/item/organ/external/tail/tza)
	)

	has_organ = list(
		BP_HEART           = /obj/item/organ/internal/heart/insectoid,
		BP_STOMACH         = /obj/item/organ/internal/stomach/insectoid,
		BP_LUNGS           = /obj/item/organ/internal/lungs/insectoid,
		BP_LIVER           = /obj/item/organ/internal/liver/insectoid,
		BP_KIDNEYS         = /obj/item/organ/internal/kidneys/insectoid,
		BP_BRAIN           = /obj/item/organ/internal/brain/insectoid,
		BP_EYES            = /obj/item/organ/internal/eyes/insectoid,
		BP_PHEROMONE_GLAND = /obj/item/organ/internal/pheromone_gland
	)

	limb_mapping = list(
		BP_CHEST = list(BP_CHEST, BP_M_ARM, BP_M_HAND),
		BP_GROIN = list(BP_GROIN, BP_M_LEG, BP_M_FOOT)
	)

	eye_icon            = 'mods/crux/icons/species/tza/eyes.dmi'
	eye_darksight_range = 7
	eye_flash_mod       = 2
	eye_blend           = ICON_MULTIPLY
	eye_low_light_vision_effectiveness    = 0.15
	eye_low_light_vision_adjustment_speed = 0.3
