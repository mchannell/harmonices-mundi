extends Node2D

var planets
var strings = []
var string_scene

func _ready() -> void:
	planets = get_tree().get_nodes_in_group("Planets")
	#string_scene = preload("res://string.tscn")
	for i in planets.size():
		for j in range(i+1,planets.size()):
			if planets[j].atmosphere_radius + planets[i].atmosphere_radius >= planets[i].position.distance_to(planets[j].position):
				create_string(planets[i],planets[j])

func create_string(planet1, planet2) -> void:
	var new_string = MusicString.new()
	new_string.root = planet1.root
	new_string.planet1 = planet1
	new_string.planet2 = planet2
	get_parent().add_child.call_deferred(new_string)
