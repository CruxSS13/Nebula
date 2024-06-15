/decl/butchery_data/humanoid/yulomnn
	meat_name = "lizard"
	skin_material = /decl/material/solid/organic/skin/lizard

/decl/species/yulomnn
	name                     = SPECIES_YULOMNN
	name_plural              = SPECIES_YULOMNN
	description              = "Lizards!"
	gluttonous               = GLUT_TINY
	strength                 = STR_HIGH
	breath_pressure          = 18
	brute_mod                = 0.8
	blood_volume             = 800
	hunger_factor            = DEFAULT_HUNGER_FACTOR * 2
	body_temperature         = null // cold-blooded, implemented the same way nabbers do it
	spawn_flags              = SPECIES_CAN_JOIN | SPECIES_NO_ROBOTIC_INTERNAL_ORGANS
	flesh_color              = "#34af10"
	preview_outfit           = /decl/hierarchy/outfit/job/generic/doctor
	move_trail               = /obj/effect/decal/cleanable/blood/tracks/claw
	breathing_sound          = 'mods/crux/sounds/lizard_breathing.ogg'
	exertion_effect_chance   = 10
	exertion_hydration_scale = 1
	exertion_reagent_scale   = 1
	exertion_reagent_path    = /decl/material/liquid/lactate
	butchery_data            = /decl/butchery_data/humanoid/yulomnn

	available_bodytypes = list(/decl/bodytype/yulomnn)

	unarmed_attacks = list(
		/decl/natural_attack/stomp,
		/decl/natural_attack/tail,
		/decl/natural_attack/claws,
		/decl/natural_attack/punch,
		/decl/natural_attack/bite/sharp
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
	pain_emotes_with_pain_level = list(
		list(/decl/emote/audible/wheeze, /decl/emote/audible/roar, /decl/emote/audible/bellow, /decl/emote/audible/howl) = 80,
		list(/decl/emote/audible/grunt, /decl/emote/audible/groan, /decl/emote/audible/wheeze, /decl/emote/audible/hiss) = 50,
		list(/decl/emote/audible/grunt, /decl/emote/audible/groan, /decl/emote/audible/hiss) = 20,
	)
	exertion_emotes_biological = list(
		/decl/emote/exertion/biological,
		/decl/emote/exertion/biological/breath,
		/decl/emote/exertion/biological/pant
	)
