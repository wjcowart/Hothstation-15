/datum/event/radiation_storm
	announceWhen	= 1
	var/safe_zones = list(
		/area/maintenance,
		/area/bridge/,
		/area/hydroponics/,
		/area/medical/,
		/area/research_outpost/,
		/area/awaymission/,
		/area/comms/,
		/area/construction/,
		/area/derelict/,
		/area/derelictparts/,
		/area/djstation/,
		/area/engine/,
		/area/engineering/,
		/area/gateway/,
		/area/hallway/,
		/area/janitor/,
		/area/janitor2/,
		/area/lawoffice/,
		/area/library/,
		/area/mine/,
		/area/planet/,
		/area/prison/,
		/area/crew_quarters/,
		/area/science/,
		/area/server/,
		/area/shuttle/,
		/area/storage/,
		/area/supply/,
		/area/syndicate_mothership/,
		/area/tcomms/,
		/area/tcommsat/,
		/area/tdome/,
		/area/teleporter/,
		/area/wreck/,
		/area/security/,
		/area/shuttle,
		/area/vox_station,
		/area/syndicate_station
	)


/datum/event/radiation_storm/announce()
	// Don't do anything, we want to pack the announcement with the actual event

/datum/event/radiation_storm/proc/is_safe_zone(var/area/A)
	//writepanic("[__FILE__].[__LINE__] ([src.type])([usr ? usr.ckey : ""])  \\/datum/event/radiation_storm/proc/is_safe_zone() called tick#: [world.time]")
	for(var/szt in safe_zones)
		if(istype(A, szt))
			return 1
	return 0

/datum/event/radiation_storm/start()
	spawn()
		world << sound('sound/AI/radiation.ogg')
		command_alert("A high-intensity radioactive snow storm is approaching, ETA in 30 seconds.. Please evacuate into the station to avoid the cold.", "Anomaly Alert")

		for(var/area/A in areas)
			if(A.z != 1 || is_safe_zone(A))
				continue
			var/area/ma = get_area_master(A)
			ma.radiation_alert()



		command_alert("The station has entered the storm. Please remain in a sheltered area until the storm has passed the station.", "Anomaly Alert")

		for(var/i = 0, i < 15, i++)
			var/irradiationThisBurst = rand(15,25) //everybody gets the same rads this radiation burst
			var/randomMutation = prob(50)
			var/badMutation = prob(50)
			for(var/mob/living/carbon/human/H in living_mob_list)
				if(istype(H.loc, /obj/spacepod))
					continue
				var/turf/T = get_turf(H)
				if(!T)
					continue
				if(T.z != 1 || is_safe_zone(T.loc))
					continue

				var/applied_rads = (H.apply_effect(irradiationThisBurst,IRRADIATE,0) > (irradiationThisBurst/4))
				if(randomMutation && applied_rads)
					if (badMutation)
						//H.apply_effect((rand(25,50)),IRRADIATE,0)
						randmutb(H) // Applies bad mutation
						domutcheck(H,null,MUTCHK_FORCED)
					else
						randmutg(H) // Applies good mutation
						domutcheck(H,null,MUTCHK_FORCED)

			sleep(25)


		command_alert("The station has passed the snow storm. Please report to medbay if you experience any unusual symptoms, such as frostbite or mutations.", "Anomaly Alert")

		for(var/area/A in areas)
			if(A.z != 1 || is_safe_zone(A))
				continue
			var/area/ma = get_area_master(A)
			ma.reset_radiation_alert()
