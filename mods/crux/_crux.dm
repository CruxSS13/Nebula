#define SPECIES_TZA     "Tza"
#define SPECIES_NAKHAYL "Nakhayl"
#define SPECIES_YULOMNN "Yulomnn"

#define BODYTYPE_TZA    "mantid worker body"
#define BODYTYPE_GNOLL  "gnoll body"

#define BODY_FLAG_TZA   BITFLAG(9)
#define BODY_FLAG_GNOLL BITFLAG(10)

#define BP_M_ARM        "m_arm"
#define BP_M_LEG        "m_leg"
#define BP_M_FOOT       "m_foot"

/decl/modpack/crux_content
	name = "Crux Content"

/decl/modpack/crux_content/pre_initialize()
	. = ..()
	global.all_limb_tags |= BP_M_ARM
	global.all_limb_tags |= BP_M_HAND
	global.all_limb_tags |= BP_M_LEG
	global.all_limb_tags |= BP_M_FOOT
	global.all_limb_tags_by_depth.Insert(global.all_limb_tags_by_depth.Find(BP_CHEST)+1, BP_M_ARM)
	global.all_limb_tags_by_depth.Insert(global.all_limb_tags_by_depth.Find(BP_M_ARM)+1, BP_M_HAND)
	global.all_limb_tags_by_depth.Insert(global.all_limb_tags_by_depth.Find(BP_GROIN)+1, BP_M_LEG)
	global.all_limb_tags_by_depth.Insert(global.all_limb_tags_by_depth.Find(BP_M_LEG)+1, BP_M_FOOT)
