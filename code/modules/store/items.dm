/////////////////////////////
// Store Item
/////////////////////////////
/datum/storeitem
	var/name="Thing"
	var/desc="It's a thing."
	var/typepath=/obj/item/weapon/storage/box
	var/cost=0

/datum/storeitem/proc/deliver(var/mob/user)
	//writepanic("[__FILE__].[__LINE__] ([src.type])([usr ? usr.ckey : ""])  \\/datum/storeitem/proc/deliver() called tick#: [world.time]")
	if(istype(typepath,/obj/item/weapon/storage))
		var/thing = new typepath(user.loc)
		user.put_in_hands(thing)
	else if(istype(typepath,/obj/item))
		var/obj/item/weapon/storage/box/box=new(user.loc)
		new typepath(box)
		box.name="[name] package"
		box.desc="A special gift for doing your job."
		user.put_in_hands(box)
	else
		new typepath(user.loc)


/////////////////////////////
// Shit for robotics/science
/////////////////////////////
/datum/storeitem/robotnik_labcoat
	name = "Robotnik's Research Labcoat"
	desc = "Join the empire and display your hatred for woodland animals."
	typepath = /obj/item/clothing/suit/storage/labcoat/custom/N3X15/robotics
	cost = 350

/datum/storeitem/robotnik_jumpsuit
	name = "Robotics Interface Suit"
	desc = "A modern black and red design with reinforced seams and brass neural interface fittings."
	typepath = /obj/item/clothing/under/custom/N3X15/robotics
	cost = 500


/////////////////////////////
// General
/////////////////////////////
/datum/storeitem/snap_pops
	name = "Snap-Pops"
	desc = "Ten-thousand-year-old chinese fireworks: IN SPACE"
	typepath = /obj/item/weapon/storage/box/snappops
	cost = 200

/datum/storeitem/crayons
	name = "Crayons"
	desc = "Let security know how they're doing by scrawling lovenotes all over their hallways."
	typepath = /obj/item/weapon/storage/fancy/crayons
	cost = 350

/datum/storeitem/beachball
	name="Beach Ball"
	desc="Summer up your office with this cheap vinyl beachball made by prisoners!"
	typepath=/obj/item/weapon/beach_ball
	cost = 500

/datum/storeitem/boombox
	name="Boombox"
	desc="I ask you a question: is a man not entitled to the beats of his own smooth jazz?"
	typepath=/obj/machinery/media/receiver/boombox
	cost = 500