/mob/living/simple_animal/hostile/cultist
	name = "Cultist"
	desc = "A follower of Nar-Sie."
	icon_state = "cultist"
	icon_living = "cultist"
	icon_dead = "cultist_dead"
	icon_gib = "syndicate_gib"
	speak_chance = 0
	turns_per_move = 5
	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "hits"
	speed = -1
	stop_automated_movement_when_pulled = 0
	maxHealth = 100
	health = 100
	harm_intent_damage = 5
	melee_damage_lower = 10
	melee_damage_upper = 10
	attacktext = "punches"
	a_intent = I_HURT
	var/obj/effect/landmark/corpse/corpse = /obj/effect/landmark/corpse/cultist
	var/weapon1
	var/weapon2
	min_oxy = 5
	max_oxy = 0
	min_tox = 0
	max_tox = 1
	min_co2 = 0
	max_co2 = 5
	min_n2 = 0
	max_n2 = 0
	unsuitable_atoms_damage = 15
	faction = "cult"
	status_flags = CANPUSH

/mob/living/simple_animal/hostile/cultist/Die()
	..()
	if(corpse)
		corpse = new corpse(loc)
		corpse.createCorpse()
	if(weapon1)
		new weapon1 (get_turf(src))
	if(weapon2)
		new weapon2 (get_turf(src))
	qdel(src)
	return

///////////////Armed////////////

/mob/living/simple_animal/hostile/cultist_armored
	name = "Cultist"
	desc = "A follower of Nar-Sie. This guy looks tough!"
	icon_state = "cultist_armored"
	icon_living = "cultist_armored"
	icon_dead = "cultist_armored_dead"
	icon_gib = "syndicate_gib"
	speak_chance = 0
	turns_per_move = 5
	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "hits"
	speed = -1
	stop_automated_movement_when_pulled = 0
	maxHealth = 200
	health = 200
	harm_intent_damage = 5
	melee_damage_lower = 25
	melee_damage_upper = 20
	attacktext = "slashes"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	a_intent = I_HURT
	var/obj/effect/landmark/corpse/corpse = /obj/effect/landmark/corpse/cultist_armored
	var/weapon1 = /obj/item/weapon/melee/cultblade
	var/weapon2
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	unsuitable_atoms_damage = 15
	faction = "cult"
	status_flags = CANPUSH

/mob/living/simple_animal/hostile/cultist_armored/attackby(var/obj/item/O as obj, var/mob/user as mob)
	user.delayNextAttack(8)
	if(O.force)
		if(prob(80))
			var/damage = O.force
			if (O.damtype == HALLOSS)
				damage = 0
			health -= damage
			visible_message("<span class='danger'>[src] has been attacked with [O] by [user]. </span>")

/mob/living/simple_animal/hostile/cultist_armed
	name = "Cultist"
	desc = "A follower of Nar-Sie, armed with a demonic blade."
	icon_state = "cultist_armed"
	icon_living = "cultist_armed"
	icon_dead = "cultist_dead"
	icon_gib = "syndicate_gib"
	speak_chance = 0
	turns_per_move = 5
	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "hits"
	speed = -1
	stop_automated_movement_when_pulled = 0
	maxHealth = 150
	health = 150
	harm_intent_damage = 5
	melee_damage_lower = 20
	melee_damage_upper = 15
	attacktext = "slashes"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	a_intent = I_HURT
	var/obj/effect/landmark/corpse/corpse = /obj/effect/landmark/corpse/cultist
	var/weapon1 = /obj/item/weapon/melee/cultblade
	var/weapon2
	min_oxy = 5
	max_oxy = 0
	min_tox = 0
	max_tox = 1
	min_co2 = 0
	max_co2 = 5
	min_n2 = 0
	max_n2 = 0
	unsuitable_atoms_damage = 15
	faction = "cult"
	status_flags = CANPUSH

/mob/living/simple_animal/hostile/cultist_armed/attackby(var/obj/item/O as obj, var/mob/user as mob)
	user.delayNextAttack(8)
	if(O.force)
		if(prob(80))
			var/damage = O.force
			if (O.damtype == HALLOSS)
				damage = 0
			health -= damage
			visible_message("<span class='danger'>[src] has been attacked with [O] by [user]. </span>")

///////////////Leader////////////

/mob/living/simple_animal/hostile/cultist_unarmed
	name = "Cult Leader"
	desc = "A follower of Nar-Sie. He seems to have a un-natural connection to the dark powers!"
	icon_state = "cultist_unarmed"
	icon_living = "cultist_unarmed"
	icon_dead = "cultist_unarmed_dead"
	icon_gib = "syndicate_gib"
	speak_chance = 0
	turns_per_move = 5
	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "hits"
	speed = 2
	stop_automated_movement_when_pulled = 0
	maxHealth = 500
	health = 500
	harm_intent_damage = 5
	melee_damage_lower = 25
	melee_damage_upper = 25
	attacktext = "punches"
	a_intent = I_HURT
	ranged = 1
	rapid = 1
	retreat_distance = 3
	minimum_distance = 3
	var/obj/effect/landmark/corpse/corpse = /obj/effect/landmark/corpse/cultist_unarmed
	var/weapon1 = /obj/item/weapon/spellbook/oneuse/fireball
	var/weapon2
	projectilesound = 'sound/effects/busteleport.ogg'
	projectiletype = /obj/item/projectile/spell_projectile/fireball

	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	unsuitable_atoms_damage = 15
	faction = "cult"
	status_flags = CANPUSH

///////////////Constructs////////////

/mob/living/simple_animal/hostile/shade
	name = "shade"
	desc = "A spooky ghost, brought into the mortal-relm via black magic."
	icon_state = "shade"
	icon_living = "shade"
	icon_dead = "shade_dead"
	speak_chance = 0
	turns_per_move = 5
	response_help = "passes through"
	response_disarm = "pushes"
	response_harm = "hits"
	speed = -1
	maxHealth = 100
	health = 100
	harm_intent_damage = 5
	melee_damage_lower = 8
	melee_damage_upper = 12
	attacktext = "steals the life from"
	attack_sound = 'sound/hallucinations/growl1.ogg'

	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0

	faction = "cult"

/mob/living/simple_animal/hostile/shade/AttackingTarget()
	. =..()
	var/mob/living/L = .
	if(istype(L))
		if(prob(15))
			L.Weaken(3)
			L.visible_message("<span class='danger'>\the [src] knocks down \the [L]!</span>")

/mob/living/simple_animal/hostile/shade/Die()
	..()
	visible_message("<span class='warning'><b>[src]</b> destroyed </span>")
	new /obj/item/weapon/ectoplasm(loc)
	del(src)

/mob/living/simple_animal/hostile/juggernaught
	name = "juggernaught"
	desc = "A behemoth of a constuct, this unholy creature can probably snap a clown in half in less than two seconds. And now you're fighting it."
	icon_state = "behemoth"
	icon_living = "behemoth"
	icon_dead = "shade_dead"
	speak_chance = 0
	turns_per_move = 5
	response_help = "pats"
	response_disarm = "pushes"
	response_harm = "hits"
	speed = 3
	maxHealth = 800
	health = 800
	harm_intent_damage = 5
	melee_damage_lower = 30
	melee_damage_upper = 30
	attacktext = "smashes the fuck out of"
	attack_sound = 'sound/weapons/heavysmash.ogg'
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0

	faction = "cult"

/mob/living/simple_animal/hostile/juggernaught/AttackingTarget()
	. =..()
	var/mob/living/L = .
	if(istype(L))
		if(prob(15))
			L.Weaken(3)
			L.visible_message("<span class='danger'>\the [src] knocks down \the [L]!</span>")

/mob/living/simple_animal/hostile/juggernaught/Die()
	..()
	visible_message("<span class='warning'><b>[src]</b> destroyed </span>")
	new /obj/item/weapon/ectoplasm(loc)
	del(src)

/mob/living/simple_animal/hostile/wraith
	name = "wraith"
	desc = "An unholy being from another relm. Doesn't look friendly."
	icon_state = "floating"
	icon_living = "floating"
	icon_dead = "shade_dead"
	speak_chance = 0
	turns_per_move = 5
	response_help = "pats"
	response_disarm = "pushes"
	response_harm = "hits"
	speed = -1
	maxHealth = 250
	health = 250
	harm_intent_damage = 5
	melee_damage_lower = 25
	melee_damage_upper = 25
	attacktext = "bashes"
	attack_sound = 'sound/weapons/rapidslice.ogg'

	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0

	faction = "cult"

/mob/living/simple_animal/hostile/wraith/AttackingTarget()
	. =..()
	var/mob/living/L = .
	if(istype(L))
		if(prob(15))
			L.Weaken(3)
			L.visible_message("<span class='danger'>\the [src] knocks down \the [L]!</span>")

/mob/living/simple_animal/hostile/wraith/Die()
	..()
	visible_message("<span class='warning'><b>[src]</b> destroyed </span>")
	new /obj/item/weapon/ectoplasm(loc)
	del(src)

/mob/living/simple_animal/hostile/artificer
	name = "artificer"
	desc = "A simple construct, used by the cultists for repair and construction."
	icon_state = "artificer"
	icon_living = "artificer"
	icon_dead = "shade_dead"
	speak_chance = 0
	turns_per_move = 5
	response_help = "pats"
	response_disarm = "pushes"
	response_harm = "hits"
	speed = 0
	maxHealth = 75
	health = 75
	harm_intent_damage = 5
	melee_damage_lower = 5
	melee_damage_upper = 5
	attacktext = "bashes"
	attack_sound = 'sound/weapons/rapidslice.ogg'
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0

	faction = "cult"

/mob/living/simple_animal/hostile/aritficer/AttackingTarget()
	. =..()
	var/mob/living/L = .
	if(istype(L))
		if(prob(15))
			L.Weaken(3)
			L.visible_message("<span class='danger'>\the [src] knocks down \the [L]!</span>")

/mob/living/simple_animal/hostile/aritficer/Die()
	..()
	visible_message("<span class='warning'><b>[src]</b> destroyed </span>")
	new /obj/item/weapon/ectoplasm(loc)
	del(src)