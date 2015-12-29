#define SYNDICATE_SHUTTLE_MOVE_TIME 240
#define SYNDICATE_SHUTTLE_COOLDOWN 200

/obj/machinery/computer/syndicate_station
	name = "Lift Control Panel"
	icon = 'icons/obj/computer.dmi'
	icon_state = "elevatorbuttons"
	density = 0
	var/area/curr_location
	var/moving = 0
	var/lastMove = 0

/obj/machinery/computer/syndicate_station/New()
	curr_location= locate(/area/shuttle/marina/elevator/firstfloor)


/obj/machinery/computer/syndicate_station/proc/syndicate_move_to(area/destination as area)
	if(moving)	return
	if(lastMove + SYNDICATE_SHUTTLE_COOLDOWN > world.time)	return
	var/area/dest_location = locate(destination)
	if(curr_location == dest_location)	return

	moving = 1
	lastMove = world.time

	if(curr_location.z != dest_location.z)
		var/area/transit_location = locate(/area/syndicate_station/transit)
		curr_location.move_contents_to(transit_location)
		curr_location = transit_location
		playsound(src.loc, 'sound/music/lift.ogg', 50, 0, 1)
		sleep(SYNDICATE_SHUTTLE_MOVE_TIME)

	curr_location.move_contents_to(dest_location)
	curr_location = dest_location
	moving = 0
	return 1

/obj/machinery/computer/syndicate_station/attackby(obj/item/I as obj, mob/user as mob)
	return attack_hand(user)

/obj/machinery/computer/syndicate_station/attack_ai(mob/user as mob)
	return attack_hand(user)

/obj/machinery/computer/syndicate_station/attack_paw(mob/user as mob)
	return attack_hand(user)

/obj/machinery/computer/syndicate_station/attack_hand(mob/user as mob)
	if(!allowed(user))
		user << "\red Access Denied"
		return

	user.set_machine(src)

	var/dat = {"Location: [curr_location]<br>
	Ready to move[max(lastMove + SYNDICATE_SHUTTLE_COOLDOWN - world.time, 0) ? " in [max(round((lastMove + SYNDICATE_SHUTTLE_COOLDOWN - world.time) * 0.1), 0)] seconds" : ": now"]<br>
	<a href='?src=\ref[src];firstfloor=1'>First floor</a><br>
	<a href='?src=\ref[src];secondfloor=1'>Second floor</a>"}

	user << browse(dat, "window=computer;size=238x144")
	onclose(user, "computer")
	return


/obj/machinery/computer/syndicate_station/Topic(href, href_list)
	if(!isliving(usr))	return
	var/mob/living/user = usr

	if(in_range(src, user) || istype(user, /mob/living/silicon))
		user.set_machine(src)

	if(href_list["firstfloor"])
		syndicate_move_to(/area/shuttle/marina/elevator/firstfloor)
	else if(href_list["secondfloor"])
		syndicate_move_to(/area/shuttle/marina/elevator/secondfloor)

	add_fingerprint(usr)
	updateUsrDialog()
	return

/obj/machinery/computer/syndicate_station/bullet_act(var/obj/item/projectile/Proj)
	visible_message("[Proj] ricochets off [src]!")	//let's not let them fuck themselves in the rear