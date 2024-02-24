// Other flora.
/obj/structure/flora/mushroom
	name = "mushroom"
	desc = "Hey, this one seems like a fun guy."
	icon = 'icons/obj/flora/mushrooms.dmi'
	icon_state = "mush1"

/obj/structure/flora/mushroom/init_appearance()
	. = ..()
	icon_state = "mush[rand(1,4)]"
	if(prob(50))
		set_scale(-1, 1)
	default_pixel_x += rand(-4, 4)
	reset_offsets()
