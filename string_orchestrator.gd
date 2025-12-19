extends Node2D

var planets

func _ready() -> void:
	planets = get_tree().get_nodes_in_group("Planets")

func _draw() -> void:
	for i in planets.size():
		for j in range(i,planets.size()):
			if planets[j].atmosphere_radius + planets[i].atmosphere_radius >= planets[i].position.distance_to(planets[j].position):
				draw_line(planets[i].position, planets[j].position, Color.PURPLE,10)
				#create_string(planets[i],planets[j])

func create_string(planet1, planet2) -> void:
	pass
