//This file was auto-corrected by findeclaration.exe on 25.5.2012 20:42:31

// Marina Apartments

	// Jobs

/var/const/access_tenant = 1
/var/const/access_doorman = 2
/var/const/access_nurse = 3
/var/const/access_guard = 4
/var/const/access_maintenance_technician = 5

	// Apartments

/var/const/access_a1 = 11
/var/const/access_a2 = 12
/var/const/access_a3 = 13
/var/const/access_a4 = 14
/var/const/access_a5 = 15

/var/const/access_b1 = 21
/var/const/access_b2 = 22
/var/const/access_b3 = 23
/var/const/access_b4 = 24

/var/const/access_c1 = 31
/var/const/access_c2 = 32
/var/const/access_c3 = 33
/var/const/access_c4 = 34
/var/const/access_c5 = 35
/var/const/access_c6 = 36
/var/const/access_c7 = 37
/var/const/access_c8 = 38
/var/const/access_c9 = 39
/var/const/access_c10 = 310
/var/const/access_c11 = 311

/var/const/access_d1 = 41
/var/const/access_d2 = 42
/var/const/access_d3 = 43
/var/const/access_d4 = 44
/var/const/access_d5 = 45
/var/const/access_d6 = 46
/var/const/access_d7 = 47
/var/const/access_d8 = 48

/var/const/access_e1 = 51
/var/const/access_e2 = 52
/var/const/access_e3 = 53
/var/const/access_e4 = 54


// Old

/var/const/access_medical = 308
/var/const/access_security = 480
/var/const/access_forensics_lockers= 400
/var/const/access_morgue = 600
/var/const/access_tox = 700
/var/const/access_tox_storage = 800
/var/const/access_genetics = 900
/var/const/access_engine = 100
/var/const/access_engine_equip= 110
/var/const/access_maint_tunnels = 120
/var/const/access_external_airlocks = 130
/var/const/access_emergency_storage = 140
/var/const/access_change_ids = 150
/var/const/access_ai_upload = 160
/var/const/access_teleporter = 170
/var/const/access_eva = 180
/var/const/access_heads = 190
/var/const/access_captain = 200
/var/const/access_all_personal_lockers = 210
/var/const/access_chapel_office = 220
/var/const/access_tech_storage = 230
/var/const/access_atmospherics = 240
/var/const/access_bar = 250
/var/const/access_crematorium = 270
/var/const/access_kitchen = 280
/var/const/access_robotics = 290
/var/const/access_rd = 300
/var/const/access_cargo = 31
/var/const/access_construction = 320
/var/const/access_chemistry = 330
/var/const/access_cargo_bot = 340
/var/const/access_hydroponics = 350
/var/const/access_manufacturing = 360
/var/const/access_library = 370
/var/const/access_lawyer = 380
/var/const/access_virology = 390
/var/const/access_cmo = 400
/var/const/access_qm = 410
/var/const/access_court = 420
/var/const/access_clown = 430
/var/const/access_mime = 440
/var/const/access_surgery = 450
/var/const/access_theatre = 460
/var/const/access_research = 470
/var/const/access_mining = 480
/var/const/access_mining_office = 490 //not in use
/var/const/access_mailsorting = 500
/var/const/access_mint = 510
/var/const/access_mint_vault = 520
/var/const/access_heads_vault = 530
/var/const/access_mining_station = 540
/var/const/access_xenobiology = 550
/var/const/access_ce = 560
/var/const/access_hop = 570
/var/const/access_hos = 580
/var/const/access_RC_announce = 590 //Request console announcements
/var/const/access_keycard_auth = 600 //Used for events which require at least two people to confirm them
/var/const/access_tcomsat = 610 // has access to the entire telecomms satellite / machinery
/var/const/access_gateway = 620
/var/const/access_sec_doors = 630 // Security front doors
/var/const/access_psychiatrist = 640 // Psychiatrist's office
/var/const/access_xenoarch = 650
/var/const/access_brig = 999 // Brig timers and permabrig

	//BEGIN CENTCOM ACCESS
	/*Should leave plenty of room if we need to add more access levels.
/var/const/Mostly for admin fun times.*/
/var/const/access_cent_general = 101//General facilities.
/var/const/access_cent_thunder = 102//Thunderdome.
/var/const/access_cent_specops = 103//Special Ops.
/var/const/access_cent_medical = 104//Medical/Research
/var/const/access_cent_living = 105//Living quarters.
/var/const/access_cent_storage = 106//Generic storage areas.
/var/const/access_cent_teleporter = 107//Teleporter.
/var/const/access_cent_creed = 108//Creed's office.
/var/const/access_cent_captain = 109//Captain's office/ID comp/AI.

	//The Syndicate
/var/const/access_syndicate = 150//General Syndicate Access

	//MONEY
/var/const/access_crate_cash = 200

/obj/var/list/req_access = null
/obj/var/req_access_txt = "0"
/obj/var/list/req_one_access = null
/obj/var/req_one_access_txt = "0"

//returns 1 if this mob has sufficient access to use this object
/obj/proc/allowed(mob/M)
	//check if it doesn't require any access at all
	if(src.check_access(null))
		return 1
	if(istype(M, /mob/living/silicon))
		//AI can do whatever he wants
		return 1
	else if(istype(M, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = M
		//if they are holding or wearing a card that has access, that works
		if(src.check_access(H.get_active_hand()) || src.check_access(H.wear_id))
			return 1
	else if(istype(M, /mob/living/carbon/monkey) || istype(M, /mob/living/carbon/alien/humanoid))
		var/mob/living/carbon/george = M
		//they can only hold things :(
		if(src.check_access(george.get_active_hand()))
			return 1
	return 0

/obj/item/proc/GetAccess()
	return list()

/obj/item/proc/GetID()
	return null

/obj/proc/check_access(obj/item/I)
	//These generations have been moved out of /obj/New() because they were slowing down the creation of objects that never even used the access system.
	if(!src.req_access)
		src.req_access = list()
		if(src.req_access_txt)
			var/list/req_access_str = text2list(req_access_txt,";")
			for(var/x in req_access_str)
				var/n = text2num(x)
				if(n)
					req_access += n

	if(!src.req_one_access)
		src.req_one_access = list()
		if(src.req_one_access_txt)
			var/list/req_one_access_str = text2list(req_one_access_txt,";")
			for(var/x in req_one_access_str)
				var/n = text2num(x)
				if(n)
					req_one_access += n

	if(!istype(src.req_access, /list)) //something's very wrong
		return 1

	var/list/L = src.req_access
	if(!L.len && (!src.req_one_access || !src.req_one_access.len)) //no requirements
		return 1
	if(!I)
		return 0
	for(var/req in src.req_access)
		if(!(req in I.GetAccess())) //doesn't have this access
			return 0
	if(src.req_one_access && src.req_one_access.len)
		for(var/req in src.req_one_access)
			if(req in I.GetAccess()) //has an access from the single access list
				return 1
		return 0
	return 1


/obj/proc/check_access_list(var/list/L)
	if(!src.req_access  && !src.req_one_access)	return 1
	if(!istype(src.req_access, /list))	return 1
	if(!src.req_access.len && (!src.req_one_access || !src.req_one_access.len))	return 1
	if(!L)	return 0
	if(!istype(L, /list))	return 0
	for(var/req in src.req_access)
		if(!(req in L)) //doesn't have this access
			return 0
	if(src.req_one_access && src.req_one_access.len)
		for(var/req in src.req_one_access)
			if(req in L) //has an access from the single access list
				return 1
		return 0
	return 1

/* /proc/get_centcom_access(job)
	switch(job)
		if("VIP Guest")
			return list(access_cent_general)
		if("Custodian")
			return list(access_cent_general, access_cent_living, access_cent_storage)
		if("Thunderdome Overseer")
			return list(access_cent_general, access_cent_thunder)
		if("Intel Officer")
			return list(access_cent_general, access_cent_living)
		if("Medical Officer")
			return list(access_cent_general, access_cent_living, access_cent_medical)
		if("Death Commando")
			return list(access_cent_general, access_cent_specops, access_cent_living, access_cent_storage)
		if("Research Officer")
			return list(access_cent_general, access_cent_specops, access_cent_medical, access_cent_teleporter, access_cent_storage)
		if("BlackOps Commander")
			return list(access_cent_general, access_cent_thunder, access_cent_specops, access_cent_living, access_cent_storage, access_cent_creed)
		if("Supreme Commander")
			return get_all_centcom_access() */

/proc/get_all_accesses()
	return list()

/proc/get_all_centcom_access()
	return list()

/proc/get_all_syndicate_access()
	return list(access_syndicate)

/proc/get_region_accesses(var/code)
	switch(code)
		if(0)
			return get_all_accesses()
		if(1) //security
			return list()
		if(2) //medbay
			return list()
		if(3) //research
			return list()
		if(4) //engineering and maintenance
			return list()
		if(5) //command
			return list()
		if(6) //station general
			return list()
		if(7) //supply
			return list()

/proc/get_region_accesses_name(var/code)
	switch(code)
		if(0)
			return "All"
		if(1) //security
			return "Security"
		if(2) //medbay
			return "Medbay"
		if(3) //research
			return "Research"
		if(4) //engineering and maintenance
			return "Engineering"
		if(5) //command
			return "Command"
		if(6) //station general
			return "Station General"
		if(7) //supply
			return "Supply"


/proc/get_access_desc(A)
	switch(A)
		if(access_cargo)
			return "Cargo Bay"
		if(access_cargo_bot)
			return "Cargo Bot Delivery"
		if(access_security)
			return "Security"
		if(access_brig)
			return "Holding Cells"
		if(access_court)
			return "Courtroom"
		if(access_forensics_lockers)
			return "Forensics"
		if(access_medical)
			return "Medical"
		if(access_genetics)
			return "Genetics Lab"
		if(access_morgue)
			return "Morgue"
		if(access_tox)
			return "R&D Lab"
		if(access_tox_storage)
			return "Toxins Lab"
		if(access_chemistry)
			return "Chemistry Lab"
		if(access_rd)
			return "Research Director"
		if(access_bar)
			return "Bar"
		if(access_doorman)
			return "Custodial Closet"
		if(access_engine)
			return "Engineering"
		if(access_engine_equip)
			return "Power Equipment"
		if(access_maint_tunnels)
			return "Maintenance"
		if(access_external_airlocks)
			return "External Airlocks"
		if(access_emergency_storage)
			return "Emergency Storage"
		if(access_change_ids)
			return "ID Computer"
		if(access_ai_upload)
			return "AI Upload"
		if(access_teleporter)
			return "Teleporter"
		if(access_eva)
			return "EVA"
		if(access_heads)
			return "Bridge"
		if(access_captain)
			return "Captain"
		if(access_all_personal_lockers)
			return "Personal Lockers"
		if(access_chapel_office)
			return "Chapel Office"
		if(access_tech_storage)
			return "Technical Storage"
		if(access_atmospherics)
			return "Atmospherics"
		if(access_crematorium)
			return "Crematorium"
		if(access_construction)
			return "Construction Areas"
		if(access_kitchen)
			return "Kitchen"
		if(access_hydroponics)
			return "Hydroponics"
		if(access_library)
			return "Library"
		if(access_lawyer)
			return "Law Office"
		if(access_robotics)
			return "Robotics"
		if(access_virology)
			return "Virology"
		if(access_psychiatrist)
			return "Psychiatrist's Office"
		if(access_cmo)
			return "Chief Medical Officer"
		if(access_qm)
			return "Quartermaster"
/*		if(access_clown)
			return "HONK! Access"
		if(access_mime)
			return "Silent Access"*/
		if(access_surgery)
			return "Surgery"
		if(access_theatre)
			return "Theatre"
		if(access_manufacturing)
			return "Manufacturing"
		if(access_research)
			return "Science"
		if(access_mining)
			return "Mining"
		if(access_mining_office)
			return "Mining Office"
		if(access_mailsorting)
			return "Cargo Office"
		if(access_mint)
			return "Mint"
		if(access_mint_vault)
			return "Mint Vault"
		if(access_heads_vault)
			return "Main Vault"
		if(access_mining_station)
			return "Mining EVA"
		if(access_xenobiology)
			return "Xenobiology Lab"
		if(access_xenoarch)
			return "Xenoarchaeology"
		if(access_hop)
			return "Head of Personnel"
		if(access_hos)
			return "Head of Security"
		if(access_ce)
			return "Chief Engineer"
		if(access_RC_announce)
			return "RC Announcements"
		if(access_keycard_auth)
			return "Keycode Auth. Device"
		if(access_tcomsat)
			return "Telecommunications"
		if(access_gateway)
			return "Gateway"
		if(access_sec_doors)
			return "Brig"

/* /proc/get_centcom_access_desc(A)
	switch(A)
		if(access_cent_general)
			return "Code Grey"
		if(access_cent_thunder)
			return "Code Yellow"
		if(access_cent_storage)
			return "Code Orange"
		if(access_cent_living)
			return "Code Green"
		if(access_cent_medical)
			return "Code White"
		if(access_cent_teleporter)
			return "Code Blue"
		if(access_cent_specops)
			return "Code Black"
		if(access_cent_creed)
			return "Code Silver"
		if(access_cent_captain)
			return "Code Gold"
			*/

/proc/get_all_jobs()
	var/list/all_jobs = list()
	var/list/all_datums = typesof(/datum/job)
	all_datums.Remove(list(/datum/job,/datum/job/ai,/datum/job/cyborg))
	var/datum/job/jobdatum
	for(var/jobtype in all_datums)
		jobdatum = new jobtype
		all_jobs.Add(jobdatum.title)
	return all_jobs

/proc/get_all_centcom_jobs()
	return list("VIP Guest","Custodian","Thunderdome Overseer","Intel Officer","Medical Officer","Death Commando","Research Officer","BlackOps Commander","Supreme Commander")

//gets the actual job rank (ignoring alt titles)
//this is used solely for sechuds
/obj/proc/GetJobRealName()
	if (!istype(src, /obj/item/device/pda) && !istype(src,/obj/item/weapon/card/id))
		return

	var/rank
	var/assignment
	if(istype(src, /obj/item/device/pda))
		if(src:id)
			rank = src:id:rank
			assignment = src:id:assignment
	else if(istype(src, /obj/item/weapon/card/id))
		rank = src:rank
		assignment = src:assignment

	if( rank in joblist )
		return rank

	if( assignment in joblist )
		return assignment

	return "Unknown"

//gets the alt title, failing that the actual job rank
//this is unused
/obj/proc/sdsdsd()	//GetJobDisplayName
	if (!istype(src, /obj/item/device/pda) && !istype(src,/obj/item/weapon/card/id))
		return

	var/assignment
	if(istype(src, /obj/item/device/pda))
		if(src:id)
			assignment = src:id:assignment
	else if(istype(src, /obj/item/weapon/card/id))
		assignment = src:assignment

	if(assignment)
		return assignment

	return "Unknown"

proc/FindNameFromID(var/mob/living/carbon/human/H)
	ASSERT(istype(H))
	var/obj/item/weapon/card/id/C = H.get_active_hand()
	if( istype(C) || istype(C, /obj/item/device/pda) )
		var/obj/item/weapon/card/id/ID = C

		if( istype(C, /obj/item/device/pda) )
			var/obj/item/device/pda/pda = C
			ID = pda.id
		if(!istype(ID))
			ID = null

		if(ID)
			return ID.registered_name

	C = H.wear_id

	if( istype(C) || istype(C, /obj/item/device/pda) )
		var/obj/item/weapon/card/id/ID = C

		if( istype(C, /obj/item/device/pda) )
			var/obj/item/device/pda/pda = C
			ID = pda.id
		if(!istype(ID))
			ID = null

		if(ID)
			return ID.registered_name

proc/get_all_job_icons() //For all existing HUD icons
	return joblist + list("Prisoner")

/obj/proc/GetJobName() //Used in secHUD icon generation
	if (!istype(src, /obj/item/device/pda) && !istype(src,/obj/item/weapon/card/id))
		return

	var/jobName

	if(istype(src, /obj/item/device/pda))
		if(src:id)
			jobName = src:id:assignment
	if(istype(src, /obj/item/weapon/card/id))
		jobName = src:assignment

	if(jobName in get_all_job_icons()) //Check if the job has a hud icon
		return jobName
	if(jobName in get_all_centcom_jobs()) //Return with the NT logo if it is a Centcom job
		return "Centcom"
	return "Unknown" //Return unknown if none of the above apply

