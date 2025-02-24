/area/crux/habitation
	name = "\improper Cafeteria"
	sound_env = MEDIUM_SOFTFLOOR
	holomap_color = HOLOMAP_AREACOLOR_CREW

/area/crux/habitation/hop
	name = "\improper Command - HoP's Office"
	icon_state = "head_quarters"
	holomap_color = HOLOMAP_AREACOLOR_COMMAND
	area_flags = AREA_FLAG_IS_NOT_PERSISTENT
	req_access = list(access_hop)

/area/crux/habitation/hor
	name = "\improper Research - RD's Office"
	icon_state = "head_quarters"
	holomap_color = HOLOMAP_AREACOLOR_SCIENCE
	area_flags = AREA_FLAG_IS_NOT_PERSISTENT
	req_access = list(access_rd)

/area/crux/habitation/chief
	name = "\improper Engineering - CE's Office"
	icon_state = "head_quarters"
	holomap_color = HOLOMAP_AREACOLOR_ENGINEERING
	req_access = list(access_ce)

/area/crux/habitation/servicemanager
	name = "\improper Service Manager's Office"
	icon_state = "head_quarters"
	holomap_color = HOLOMAP_AREACOLOR_SECURITY
	req_access = list(access_hos)

/area/crux/habitation/cmo
	name = "\improper Medbay - CMO's Office"
	icon_state = "head_quarters"
	holomap_color = HOLOMAP_AREACOLOR_MEDICAL
	area_flags = AREA_FLAG_IS_NOT_PERSISTENT
	req_access = list(access_cmo)

/area/crux/habitation/sd
	name = "\improper Command - Station Director's Office"
	icon_state = "captain"
	holomap_color = HOLOMAP_AREACOLOR_COMMAND
	req_access = list(access_captain)

/area/crux/habitation/gym
	name = "\improper Station Gym"
	icon_state = "fitness"

/area/crux/habitation/toilet
	name = "\improper Toilets"

/area/crux/habitation/toilet/firstdeck
	name = "\improper Ground Floor Restroom"

/area/crux/habitation/toilet/seconddeck_south
	name = "\improper First Floor South Restroom"

/area/crux/habitation/kitchen
	name = "\improper Kitchen"
	req_access = list(access_kitchen)

/area/crux/habitation/kitchen/coldroom
	name = "\improper Kitchen Cold Room"

/area/crux/habitation/bar
	name = "\improper Bar"
	req_access = list(access_bar)

/area/crux/habitation/hop/quarters
	name = "\improper Command - HoP's Quarters"
	icon_state = "head_quarters"
	req_access = list(access_hop)

/area/crux/habitation/hor/quarters
	name = "\improper Research - RD's Quarters"
	icon_state = "research"
	req_access = list(access_rd)

/area/crux/habitation/chief/quarters
	name = "\improper Engineering - CE's Quarters"
	icon_state = "engine"
	req_access = list(access_ce)

/area/crux/habitation/servicemanager/quarters
	name = "\improper Security - HoS' Quarters"
	icon_state = "security"
	req_access = list(access_hos)

/area/crux/habitation/cmo/quarters
	name = "\improper Medbay - CMO's Quarters"
	icon_state = "medbay"
	req_access = list(access_cmo)

/area/crux/habitation/restroom
	name = "\improper Command - Restroom"
	icon_state = "toilet"
	req_access = list(access_bridge)

/area/crux/habitation/bs
	name = "\improper Command - Secretary Quarters"
	req_access = list(access_bridge)

/area/crux/habitation/janitor
	name = "\improper Custodial Office"
	req_access = list(access_janitor)

/area/crux/habitation/hydroponics
	name = "\improper Hydroponics"
	req_access = list(access_hydroponics)

/area/crux/habitation/chapel
	name = "\improper Prayer Room"

/area/crux/habitation/library
	name = "\improper Library"

/area/crux/habitation/library/office
	name = "\improper Library - Curator's Office"
	req_access = list(access_library)
