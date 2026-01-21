extends Node2D

var planets
var strings = []
var string_scene

func _ready() -> void:
	planets = get_tree().get_nodes_in_group("Planets")
	#string_scene = preload("res://string.tscn")
	for i in planets.size():
		print_debug(i)
		if planets[i].is_active:
			print_debug("cool")
			for j in planets.size():
				if i != j and planets[j].atmosphere_radius + planets[i].atmosphere_radius >= planets[i].position.distance_to(planets[j].position):
					create_string(planets[i],planets[j])
		#for j in range(i+1,planets.size()):
			#if planets[j].atmosphere_radius + planets[i].atmosphere_radius >= planets[i].position.distance_to(planets[j].position):
				#create_string(planets[i],planets[j])

func create_string(planet1, planet2) -> void:
	#if planet2.radius > planet1.radius:
		#var temp_planet = planet1
		#planet1 = planet2
		#planet2 = temp_planet
	var new_string = MusicString.new()
	new_string.play_sound.connect(ping_planets.bind())
	#print_debug(planet1.root)
	#print_debug(planet2.root)
	#print_debug(((2*planet1.root - planet2.root + 12) % 12))
	#new_string.root = floor((planet1.root + planet2.root) / 2)
	#new_string.root = (2*planet1.root - planet2.root + 12) % 12
	#print_debug("here good ", new_string.root)
	new_string.root = planet2.root
	new_string.planet1 = planet1
	new_string.planet2 = planet2
	for m_str in strings:
		print_debug("m str planet 1: ", m_str.planet1)
		print_debug("m str planet 2: ", m_str.planet2)
		print_debug("new string planet 1: ", new_string.planet1)
		print_debug("new string planet 2: ", new_string.planet1)
		if m_str.planet1 == new_string.planet2 and m_str.planet2 == new_string.planet1:
			print_debug("got it")
			new_string.half_sized = true
			m_str.half_sized = true
			m_str.queue_redraw()
	strings.append(new_string)
	get_parent().add_child.call_deferred(new_string)

func ping_planets(music_string: MusicString):
	for planet in planets:
		var is_active_temp = planet.is_active
		planet.respond_to_sound(music_string.root)
		if planet.is_active != is_active_temp:
			var strings_temp = strings.duplicate()
			if !planet.is_active:
				for m_str in strings_temp:
					if m_str.planet1 == planet:
						strings.erase(m_str)
						m_str.queue_free()
					if m_str.planet2 == planet:
						m_str.half_sized = false
						m_str.queue_redraw()
			else:
				for planet2 in planets:
					if planet2 != planet and planet2.atmosphere_radius + planet.atmosphere_radius >= planet.position.distance_to(planet2.position):
						create_string(planet,planet2)
