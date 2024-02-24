#if !defined(USING_MAP_DATUM)

	#include "../../mods/crux/_crux.dme"

	#include "../../mods/content/mundane.dm"
	#include "../../mods/content/corporate/_corporate.dme"
	#include "../../mods/content/government/_government.dme"
	#include "../../mods/content/modern_earth/_modern_earth.dme"
	#include "../../mods/content/mouse_highlights/_mouse_highlight.dme"
	#include "../../mods/content/scaling_descriptors.dm"
	#include "../../mods/content/xenobiology/_xenobiology.dme"
	#include "../../mods/content/matchmaking/_matchmaking.dme"
	#include "../../mods/species/utility_frames/_utility_frames.dme"

	#include "budgie_areas.dm"
	#include "budgie_levels.dm"
	#include "budgie_jobs.dm"

	#include "budgie-1.dmm"

	#define USING_MAP_DATUM /datum/map/budgie

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Budgie

#endif
