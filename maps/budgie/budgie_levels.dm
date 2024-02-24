/datum/level_data/budgie
	use_global_exterior_ambience = FALSE
	ambient_light_level = 1
	ambient_light_color = "#f3e6ca"
	base_turf = /turf/exterior/dirt
	exterior_atmosphere = list(
		/decl/material/gas/oxygen =   MOLES_O2STANDARD,
		/decl/material/gas/nitrogen = MOLES_N2STANDARD
	)
	strata = /decl/strata/sedimentary
	// Firedoors can be mapped over maintenance shafts.
	UT_turf_exceptions_by_door_type = list(
		/obj/machinery/door/firedoor = list(
			/turf/open,
			/turf/open
		)
	)
	abstract_type = /datum/level_data/budgie

/datum/level_data/budgie/ground_floor
	name = "Cape Budgerigar - Ground Floor"
	level_id = "budgie_ground"
/*
	connected_levels = list(
		"budgie_wilderness" = EAST,
		"budgie_over_sea"   = WEST
	)
*/
	base_area = /area/budgie/outside
	level_generators = list(
		/datum/random_map/noise/crux/grassland
	)
/obj/abstract/level_data_spawner/budgie_ground_floor
	name = "Cape Budgerigar - Ground Floor"
	level_data_type = /datum/level_data/budgie/ground_floor
