extends Node2D
@export var radius: int
@export var atmosphere_radius: int
@export var root: Pitch

enum Pitch {Ab, A, Bb, B, C, Db, D, Eb, E, F, Fb, G}

func _draw() -> void:
	draw_circle(Vector2.ZERO, atmosphere_radius,Color(0,1,0,.2))
	draw_circle(Vector2(0,0),radius,Color.RED)
	get_node("StaticBody2D").get_node("CollisionShape2D").shape.radius = radius

func _ready() -> void:
	add_to_group("Planets")
