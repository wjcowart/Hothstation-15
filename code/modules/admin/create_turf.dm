/var/create_turf_html = null
/datum/admins/proc/create_turf(var/mob/user)
	//writepanic("[__FILE__].[__LINE__] ([src.type])([usr ? usr.ckey : ""])  \\/datum/admins/proc/create_turf() called tick#: [world.time]")
	if (!create_turf_html)
		var/turfjs = null
		turfjs = list2text(typesof(/turf), ";")
		create_turf_html = file2text('html/create_object.html')
		create_turf_html = replacetext(create_turf_html, "null /* object types */", "\"[turfjs]\"")

	user << browse(replacetext(create_turf_html, "/* ref src */", "\ref[src]"), "window=create_turf;size=425x475")
