/datum/appearance_descriptor/height
	name = "height"
	standalone_value_descriptors = list(
		"very short",
		"short",
		"of average height",
		"tall",
		"very tall"
	)
	comparative_value_descriptor_equivalent = "around the same height as you"
	comparative_value_descriptors_smaller = list(
		"slightly shorter than you",
		"shorter than you",
		"much shorter than you",
		"tiny and insignificant next to you"
	)
	comparative_value_descriptors_larger = list(
		"slightly taller than you",
		"taller than you",
		"much taller than you",
		"towering over you"
	)

/datum/appearance_descriptor/build
	name = "build"
	comparative_value_descriptor_equivalent = "around the same build as you"
	standalone_value_descriptors = list(
		"rail thin",
		"thin",
		"of average build",
		"well-built",
		"heavily built"
	)
	comparative_value_descriptors_smaller = list(
		"a bit smaller in build than you",
		"smaller in build than you",
		"much smaller in build than you",
		"dwarfed by your bulk"
	)
	comparative_value_descriptors_larger = list(
		"slightly larger than you in build",
		"built larger than you",
		"built much larger than you",
		"dwarfing you"
	)

/datum/appearance_descriptor/body_length
	name = "body length"
	comparative_value_descriptor_equivalent = "around the same length as yours"
	standalone_value_descriptors = list(
		"short and stubby",
		"rather short",
		"of average length",
		"quite long",
		"extremely long"
		)
	comparative_value_descriptors_smaller = list(
		"a bit shorter in length than yours",
		"shorter in length than yours",
		"much shorter in length than yours",
		"tiny in comparison to yours"
		)
	comparative_value_descriptors_larger = list(
		"slightly longer than yours",
		"longer than yours",
		"much longer than yours",
		"easily twice your length"
		)

/datum/appearance_descriptor/body_length/get_first_person_message_start()
	return "Your body is"

/datum/appearance_descriptor/body_length/get_third_person_message_start(var/decl/pronouns/my_gender)
	return "[my_gender.His] body is"
