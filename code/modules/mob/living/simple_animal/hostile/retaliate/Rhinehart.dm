/mob/living/simple_animal/hostile/retaliate/Rhinehart
	name = "Matthew Rhinehart"
	desc = "Look at this nerd."
	icon_state = "Rhinehart"
	icon_living = "Rhinehart"
	icon_dead = "Rhinehart_dead"
	icon_gib = "clown_gib"
	turns_per_move = 5
	response_help = "hugs"
	response_disarm = "gently pushes aside"
	response_harm = "hits"
	speak = list("Sup, nerd.", "Yo, welcome to my home. It sucks here.", "Unless you want to help me build more maps, get outta here.","Just saying, I can't die. I got like, 1000 health.","I'm fairly sure me being here is vain as fuck, but whatever.","Hey uh, if I was summoned from one of those lazarus ball things that them traitor miners get, that is both a blessing to them, and a curse to the station. Ima fuck shit up.")
	emote_see = list("says")
	speak_chance = 2
	a_intent = I_HURT
	stop_automated_movement_when_pulled = 0
	maxHealth = 1000
	health = 1000
	speed = -2
	harm_intent_damage = 4
	melee_damage_lower = 25
	melee_damage_upper = 30
	attacktext = "attacks"
	attack_sound = 'sound/items/bikehorn.ogg'
	var/obj/effect/landmark/corpse/corpse = /obj/effect/landmark/corpse/Rhinehart

	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0
	maxbodytemp = 0
	heat_damage_per_tick = 0	//amount of damage applied if animal's body temperature is higher than maxbodytemp
	cold_damage_per_tick = 0	//same as heat_damage_per_tick, only if the bodytemperature it's lower than minbodytemp
	unsuitable_atoms_damage = 0
