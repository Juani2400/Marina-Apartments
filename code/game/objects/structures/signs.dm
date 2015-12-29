/obj/structure/sign
	icon = 'icons/obj/decals.dmi'
	anchored = 1
	opacity = 0
	density = 0
	layer = 3.5

/obj/structure/sign/ex_act(severity)
	switch(severity)
		if(1.0)
			del(src)
			return
		if(2.0)
			del(src)
			return
		if(3.0)
			del(src)
			return
		else
	return

/obj/structure/sign/blob_act()
	del(src)
	return

/obj/structure/sign/attackby(obj/item/tool as obj, mob/user as mob)	//deconstruction
	if(istype(tool, /obj/item/weapon/screwdriver) && !istype(src, /obj/structure/sign/double))
		user << "You unfasten the sign with your [tool]."
		var/obj/item/sign/S = new(src.loc)
		S.name = name
		S.desc = desc
		S.icon_state = icon_state
		//var/icon/I = icon('icons/obj/decals.dmi', icon_state)
		//S.icon = I.Scale(24, 24)
		S.sign_state = icon_state
		del(src)
	else ..()

/obj/item/sign
	name = "sign"
	desc = ""
	icon = 'icons/obj/decals.dmi'
	w_class = 3		//big
	var/sign_state = ""

/obj/item/sign/attackby(obj/item/tool as obj, mob/user as mob)	//construction
	if(istype(tool, /obj/item/weapon/screwdriver) && isturf(user.loc))
		var/direction = input("In which direction?", "Select direction.") in list("North", "East", "South", "West", "Cancel")
		if(direction == "Cancel") return
		var/obj/structure/sign/S = new(user.loc)
		switch(direction)
			if("North")
				S.pixel_y = 32
			if("East")
				S.pixel_x = 32
			if("South")
				S.pixel_y = -32
			if("West")
				S.pixel_x = -32
			else return
		S.name = name
		S.desc = desc
		S.icon_state = sign_state
		user << "You fasten \the [S] with your [tool]."
		del(src)
	else ..()

/obj/structure/sign/double/map
	name = "station map"
	desc = "A framed picture of the station."

/obj/structure/sign/double/map/left
	icon_state = "map-left"

/obj/structure/sign/double/map/right
	icon_state = "map-right"

/obj/structure/sign/securearea
	name = "\improper SECURE AREA"
	desc = "A warning sign which reads 'SECURE AREA'."
	icon_state = "securearea"

/obj/structure/sign/biohazard
	name = "\improper BIOHAZARD"
	desc = "A warning sign which reads 'BIOHAZARD'."
	icon_state = "bio"

/obj/structure/sign/electricshock
	name = "\improper HIGH VOLTAGE"
	desc = "A warning sign which reads 'HIGH VOLTAGE'."
	icon_state = "shock"

/obj/structure/sign/examroom
	name = "\improper EXAM"
	desc = "A guidance sign which reads 'EXAM ROOM'."
	icon_state = "examroom"

/obj/structure/sign/vacuum
	name = "\improper HARD VACUUM AHEAD"
	desc = "A warning sign which reads 'HARD VACUUM AHEAD'."
	icon_state = "space"

/obj/structure/sign/tank
	name = "\improper Breathing Air Reserve"
	desc = "A warning sign that reads 'Breathing Air Reserve. Plese do not damage the air tanks, as this could provoke an instant death due to pressure if broken'."
	icon_state = "tank"

/obj/structure/sign/deathsposal
	name = "\improper DISPOSAL LEADS TO SPACE"
	desc = "A warning sign which reads 'DISPOSAL LEADS TO SPACE'."
	icon_state = "deathsposal"

/obj/structure/sign/pods
	name = "\improper ESCAPE PODS"
	desc = "A warning sign which reads 'ESCAPE PODS'."
	icon_state = "pods"

/obj/structure/sign/fire
	name = "\improper DANGER: FIRE"
	desc = "A warning sign which reads 'DANGER: FIRE'."
	icon_state = "fire"

/obj/structure/sign/nosmoking_1
	name = "\improper NO SMOKING"
	desc = "A warning sign which reads 'NO SMOKING'."
	icon_state = "nosmoking"

/obj/structure/sign/nosmoking_2
	name = "\improper NO SMOKING"
	desc = "A warning sign which reads 'NO SMOKING'."
	icon_state = "nosmoking2"

/obj/structure/sign/redcross
	name = "medbay"
	desc = "The Intergalactic symbol of Medical institutions. You'll probably get help here."
	icon_state = "redcross"

/obj/structure/sign/greencross
	name = "medbay"
	desc = "The Intergalactic symbol of Medical institutions. You'll probably get help here."
	icon_state = "greencross"

/obj/structure/sign/goldenplaque
	name = "The Most Robust Men Award for Robustness"
	desc = "To be Robust is not an action or a way of life, but a mental state. Only those with the force of Will strong enough to act during a crisis, saving friend from foe, are truly Robust. Stay Robust my friends."
	icon_state = "goldenplaque"

/obj/structure/sign/kiddieplaque
	name = "AI developers plaque"
	desc = "Next to the extremely long list of names and job titles, there is a drawing of a little child. The child appears to be retarded. Beneath the image, someone has scratched the word \"PACKETS\""
	icon_state = "kiddieplaque"

/obj/structure/sign/atmosplaque
	name = "\improper FEA Atmospherics Division plaque"
	desc = "This plaque commemorates the fall of the Atmos FEA division. For all the charred, dizzy, and brittle men who have died in its hands."
	icon_state = "atmosplaque"

/obj/structure/sign/double/maltesefalcon	//The sign is 64x32, so it needs two tiles. ;3
	name = "The Maltese Falcon"
	desc = "The Maltese Falcon, Space Bar and Grill."

/obj/structure/sign/double/maltesefalcon/left
	icon_state = "maltesefalcon-left"

/obj/structure/sign/double/maltesefalcon/right
	icon_state = "maltesefalcon-right"

/obj/structure/sign/science			//These 3 have multiple types, just var-edit the icon_state to whatever one you want on the map
	name = "\improper SCIENCE!"
	desc = "A warning sign which reads 'SCIENCE!'."
	icon_state = "science1"

/obj/structure/sign/chemistry
	name = "\improper CHEMISTRY"
	desc = "A warning sign which reads 'CHEMISTRY'."
	icon_state = "chemistry1"

/obj/structure/sign/doors
	name = "\improper CLOSE DOORS BEHIND YOU"
	desc = "A warning sign which reads 'CLOSE DOORS BEHIND YOU'."
	icon_state = "doors"

/obj/structure/sign/botany
	name = "\improper HYDROPONICS"
	desc = "A warning sign which reads 'HYDROPONICS'."
	icon_state = "hydro1"

/obj/structure/sign/stores/bistro
	name = "\improper Carol's Bistro!"
	desc = "Hungry? Just come and ask for a take-away meal!"
	icon_state = "bistro"

/obj/structure/sign/stores/clinic
	name = "\improper Coldwell's Clinic!"
	desc = "Feeling unhealthy? Dr. Coldwell has the solution!"
	icon_state = "clinic"

/obj/structure/sign/stores/veggies
	name = "\improper David's Veggies"
	desc = "Making parent's delight and children's nightmares since 2569!"
	icon_state = "veggies"

/obj/structure/sign/stores/bakery
	name = "\improper The Candy Shoppe."
	desc = "Your greatest bakery all accross the galaxy! Now with more sweets and 'Candis'!"
	icon_state = "bakery"

/obj/structure/sign/directions/science
	name = "\improper Science department"
	desc = "A direction sign, pointing out which way the Science department is."
	icon_state = "direction_sci"

/obj/structure/sign/directions/engineering
	name = "\improper Engineering department"
	desc = "A direction sign, pointing out which way the Engineering department is."
	icon_state = "direction_eng"

/obj/structure/sign/directions/security
	name = "\improper Security department"
	desc = "A direction sign, pointing out which way the Security department is."
	icon_state = "direction_sec"

/obj/structure/sign/directions/medical
	name = "\improper Medical Bay"
	desc = "A direction sign, pointing out which way the Medical Bay is."
	icon_state = "direction_med"

/obj/structure/sign/directions/evac
	name = "\improper Escape Arm"
	desc = "A direction sign, pointing out which way the escape shuttle dock is."
	icon_state = "direction_evac"

/obj/structure/sign/directions/onetofive
	name = "\improper 'Pasillo Amarillo' (A)"
	desc = "A direction sign, pointing out the direction of the Hallway 'A'."
	icon_state = "direction_onetofive"

/obj/structure/sign/directions/sixtonine
	name = "\improper 'Blue Hallway' (B)"
	desc = "A direction sign, pointing out the direction of the Hallway 'B'."
	icon_state = "direction_sixtonine"

/obj/structure/sign/directions/tentoeighteen
	name = "\improper 'Pasillo Calabaza' (C)"
	desc = "A direction sign, pointing out the direction of the Hallway 'C'."
	icon_state = "direction_tentoeighteen"

/obj/structure/sign/directions/meeting
	name = "\improper Meeting Room"
	desc = "A direction sign, pointing out which way the meeting room is."
	icon_state = "direction_meeting"

/obj/structure/sign/directions/administration
	name = "\improper Administration Office"
	desc = "A direction sign, pointing out which way the administration office is."
	icon_state = "direction_admin"

/obj/structure/sign/directions/park
	name = "\improper Park"
	desc = "A direction sign, pointing out which way the park is."
	icon_state = "direction_park"

/obj/structure/sign/directions/hydroponics
	name = "\improper Community Hydroponics"
	desc = "A direction sign, pointing out which way the Community Hydroponics is."
	icon_state = "direction_hydroponics"

/obj/structure/sign/directions/pool
	name = "\improper Pool"
	desc = "A direction sign, pointing out which way the Pool is."
	icon_state = "direction_pool"

/obj/structure/sign/directions/holodeck
	name = "\improper Holodeck"
	desc = "A direction sign, pointing out which way the Holodeck is."
	icon_state = "direction_holodeck"

/obj/structure/sign/directions/sauna
	name = "\improper Sauna"
	desc = "A direction sign, pointing out which way the Sauna is."
	icon_state = "direction_sauna"

/obj/structure/sign/directions/dhallway
	name = "\improper 'Dusty Rose Hallway' (D)"
	desc = "A direction sign, pointing out the direction of the hallway 'D'."
	icon_state = "direction_dhallway"

/obj/structure/sign/directions/ehallway
	name = "\improper 'Pasillo Esmeralda' (E)"
	desc = "A direction sign, pointing out the direction of the hallway 'E'."
	icon_state = "direction_ehallway"

/obj/structure/sign/directions/market
	name = "\improper Market"
	desc = "A direction sign, pointing out the direction of the Market."
	icon_state = "direction_market"

/obj/structure/sign/directions/floor1
	name = "\improper Floor 1"
	desc = "A direction sign, pointing out which way the first floor access is."
	icon_state = "direction_1floor"

/obj/structure/sign/directions/floor2
	name = "\improper Floor 2"
	desc = "A direction sign, pointing out which way the second floor access is."
	icon_state = "direction_2floor"

/obj/structure/sign/directions/lift
	name = "\improper Lift"
	desc = "A direction sign, pointing out which way the lift access is."
	icon_state = "direction_lift"

/obj/structure/sign/hallwaysigns/hallway_a
	name = "\improper 'Amarillo' (A) Hallway"
	desc = "A sign which shows in which hallway you are. This one shows 'A'."
	icon_state = "hallway_a"

/obj/structure/sign/hallwaysigns/hallway_b
	name = "\improper 'Blue' (B) Hallway"
	desc = "A sign which shows in which hallway you are. This one shows 'B'."
	icon_state = "hallway_b"

/obj/structure/sign/hallwaysigns/hallway_c
	name = "\improper 'Calabaza' (C) Hallway"
	desc = "A sign which shows in which hallway you are. This one shows 'C'."
	icon_state = "hallway_c"

/obj/structure/sign/hallwaysigns/hallway_d
	name = "\improper 'Dusty Rose' (D) Hallway"
	desc = "A sign which shows in which hallway you are. This one shows 'D'."
	icon_state = "hallway_d"

/obj/structure/sign/hallwaysigns/hallway_e
	name = "\improper 'Esmeralda' (E) Hallway"
	desc = "A sign which shows in which hallway you are. This one shows 'E'."
	icon_state = "hallway_e"

/obj/structure/sign/hallwaysigns/marina_left
	name = "\improper Marina Apartments"
	desc = "Where your dreams come true!."
	icon_state = "marinasignleft"

/obj/structure/sign/hallwaysigns/marina_middle
	name = "\improper Marina Apartments"
	desc = "Where your dreams come true!."
	icon_state = "marinasignmiddle"

/obj/structure/sign/hallwaysigns/marina_right
	name = "\improper Marina Apartments"
	desc = "Where your dreams come true!."
	icon_state = "marinasignright"

/obj/structure/sign/hallwaysigns/sauna_right
	name = "\improper Sauna"
	desc = "This sign indicates this is the Sauna."
	icon_state = "saunaright"

/obj/structure/sign/hallwaysigns/sauna_left
	name = "\improper Sauna"
	desc = "This sign indicates this is the Sauna."
	icon_state = "saunaleft"

/obj/structure/sign/hallwaysigns/sauna_men
	name = "\improper Male Changing Room"
	desc = "This is where males should change their clothes."
	icon_state = "saunamen"

/obj/structure/sign/hallwaysigns/sauna_women
	name = "\improper Female Changing Room"
	desc = "This is where females should change their clothes."
	icon_state = "saunawomen"

/obj/structure/sign/ads_monitor
	name = "\improper Advertising Monitor"
	desc = "A NT advertising monitor."
	icon_state = "ads_monitor"

/obj/structure/sign/ads_monitor2
	name = "\improper Advertising Monitor"
	desc = "A NT advertising monitor."
	icon_state = "ads_monitor2"

/obj/structure/sign/misc_apartments/floor1sign
	name = "\improper 'Floor 1"
	desc = "A sign which indicates the floor you are currently on."
	icon_state = "floor1"

/obj/structure/sign/misc_apartments/floor2sign
	name = "\improper 'Floor 2"
	desc = "A sign which indicates the floor you are currently on."
	icon_state = "floor2"

/obj/structure/sign/apartment/apartment_1a
	name = "\improper Apartment A-01"
	desc = "A sign which shows the number and hallway of the apartment."
	icon_state = "apartment_1a"
	pixel_y = 32

/obj/structure/sign/apartment/apartment_2a
	name = "\improper Apartment A-02"
	desc = "A sign which shows the number and hallway of the apartment."
	icon_state = "apartment_2a"
	pixel_y = 32

/obj/structure/sign/apartment/apartment_3a
	name = "\improper Apartment A-03"
	desc = "A sign which shows the number and hallway of the apartment."
	icon_state = "apartment_3a"
	pixel_y = 32

/obj/structure/sign/apartment/apartment_4a
	name = "\improper Apartment A-04"
	desc = "A sign which shows the number and hallway of the apartment."
	icon_state = "apartment_4a"
	pixel_y = 32

/obj/structure/sign/apartment/apartment_5a
	name = "\improper Apartment A-05"
	desc = "A sign which shows the number and hallway of the apartment."
	icon_state = "apartment_5a"
	pixel_y = 32

/obj/structure/sign/apartment/apartment_1b
	name = "\improper Apartment B-01"
	desc = "A sign which shows the number and hallway of the apartment."
	icon_state = "apartment_1b"
	pixel_y = 32

/obj/structure/sign/apartment/apartment_2b
	name = "\improper Apartment B-02"
	desc = "A sign which shows the number and hallway of the apartment."
	icon_state = "apartment_2b"
	pixel_y = 32

/obj/structure/sign/apartment/apartment_3b
	name = "\improper Apartment B-03"
	desc = "A sign which shows the number and hallway of the apartment."
	icon_state = "apartment_3b"
	pixel_y = 32

/obj/structure/sign/apartment/apartment_4b
	name = "\improper Apartment B-04"
	desc = "A sign which shows the number and hallway of the apartment."
	icon_state = "apartment_4b"
	pixel_y = 32

/obj/structure/sign/apartment/apartment_1c
	name = "\improper Apartment C-01"
	desc = "A sign which shows the number and hallway of the apartment."
	icon_state = "apartment_1c"
	pixel_y = 32

/obj/structure/sign/apartment/apartment_2c
	name = "\improper Apartment C-02"
	desc = "A sign which shows the number and hallway of the apartment."
	icon_state = "apartment_2c"
	pixel_y = -32

/obj/structure/sign/apartment/apartment_3c
	name = "\improper Apartment C-03"
	desc = "A sign which shows the number and hallway of the apartment."
	icon_state = "apartment_3c"
	pixel_y = 32

/obj/structure/sign/apartment/apartment_4c
	name = "\improper Apartment C-04"
	desc = "A sign which shows the number and hallway of the apartment."
	icon_state = "apartment_4c"
	pixel_y = -32

/obj/structure/sign/apartment/apartment_5c
	name = "\improper Apartment C-05"
	desc = "A sign which shows the number and hallway of the apartment."
	icon_state = "apartment_5c"
	pixel_y = 32

/obj/structure/sign/apartment/apartment_6c
	name = "\improper Apartment C-06"
	desc = "A sign which shows the number and hallway of the apartment."
	icon_state = "apartment_6c"
	pixel_y = -32

/obj/structure/sign/apartment/apartment_7c
	name = "\improper Apartment C-07"
	desc = "A sign which shows the number and hallway of the apartment."
	icon_state = "apartment_7c"
	pixel_y = -32

/obj/structure/sign/apartment/apartment_8c
	name = "\improper Apartment C-08"
	desc = "A sign which shows the number and hallway of the apartment."
	icon_state = "apartment_8c"

/obj/structure/sign/apartment/apartment_9c
	name = "\improper Apartment C-09"
	desc = "A sign which shows the number and hallway of the apartment."
	icon_state = "apartment_9c"

/obj/structure/sign/apartment/apartment_10c
	name = "\improper Apartment C-10"
	desc = "A sign which shows the number and hallway of the apartment."
	icon_state = "apartment_10c"
	pixel_x = 32

/obj/structure/sign/apartment/apartment_11c
	name = "\improper Apartment C-11"
	desc = "A sign which shows the number and hallway of the apartment."
	icon_state = "apartment_11c"
	pixel_x = 32

/obj/structure/sign/apartment/apartment_1d
	name = "\improper Apartment D-01"
	desc = "A sign which shows the number and hallway of the apartment."
	icon_state = "apartment_1d"
	pixel_y = 32

/obj/structure/sign/apartment/apartment_2d
	name = "\improper Apartment D-02"
	desc = "A sign which shows the number and hallway of the apartment."
	icon_state = "apartment_2d"
	pixel_y = 32

/obj/structure/sign/apartment/apartment_3d
	name = "\improper Apartment D-03"
	desc = "A sign which shows the number and hallway of the apartment."
	icon_state = "apartment_3d"
	pixel_y = 32

/obj/structure/sign/apartment/apartment_4d
	name = "\improper Apartment D-04"
	desc = "A sign which shows the number and hallway of the apartment."
	icon_state = "apartment_4d"
	pixel_y = 32

/obj/structure/sign/apartment/apartment_5d
	name = "\improper Apartment D-05"
	desc = "A sign which shows the number and hallway of the apartment."
	icon_state = "apartment_5d"
	pixel_y = 32

/obj/structure/sign/apartment/apartment_6d
	name = "\improper Apartment D-06"
	desc = "A sign which shows the number and hallway of the apartment."
	icon_state = "apartment_6d"
	pixel_y = 32

/obj/structure/sign/apartment/apartment_7d
	name = "\improper Apartment D-07"
	desc = "A sign which shows the number and hallway of the apartment."
	icon_state = "apartment_7d"
	pixel_y = 32

/obj/structure/sign/apartment/apartment_8d
	name = "\improper Apartment D-08"
	desc = "A sign which shows the number and hallway of the apartment."
	icon_state = "apartment_8d"
	pixel_y = 32

/obj/structure/sign/apartment/apartment_1e
	name = "\improper Apartment E-01"
	desc = "A sign which shows the number and hallway of the apartment."
	icon_state = "apartment_1e"
	pixel_y = 32

/obj/structure/sign/apartment/apartment_2e
	name = "\improper Apartment E-02"
	desc = "A sign which shows the number and hallway of the apartment."
	icon_state = "apartment_2e"
	pixel_y = 32

/obj/structure/sign/apartment/apartment_3e
	name = "\improper Apartment E-03"
	desc = "A sign which shows the number and hallway of the apartment."
	icon_state = "apartment_3e"
	pixel_y = 32

/obj/structure/sign/apartment/apartment_4e
	name = "\improper Apartment E-04"
	desc = "A sign which shows the number and hallway of the apartment."
	icon_state = "apartment_4e"
	pixel_y = 32