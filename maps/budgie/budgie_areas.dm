/datum/map/budgie
	area_coherency_test_exempt_areas = list(
		/area/space,
		/area/budgie/outside
	)
	apc_test_exempt_areas = list(
		/area/exoplanet      = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/space          = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/turbolift      = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/budgie/outside = NO_SCRUBBER|NO_VENT|NO_APC
	)

/area/budgie
	has_gravity = TRUE

/area/budgie/outside
	name = "\improper Cape Budgergiar"
	requires_power = TRUE
	always_unpowered = TRUE
	area_flags = AREA_FLAG_RAD_SHIELDED
	is_outside = OUTSIDE_YES
	interior_ambient_light_level = 0.5
	interior_ambient_light_color = "#f3e6ca"