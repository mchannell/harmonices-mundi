@tool
extends Node2D
@export var radius: int
@export var atmosphere_radius: int
@export var root: Types.Pitch

func _draw() -> void:
	global_position = global_position.snapped(Vector2(32,32))
	var atmosphere_color = Types.pitch_to_color(root)
	atmosphere_color.a = .2
	draw_circle(Vector2.ZERO, atmosphere_radius, atmosphere_color)
	draw_circle(Vector2(0,0), radius, Types.pitch_to_color(root))
	get_node("StaticBody2D").get_node("CollisionShape2D").shape = CircleShape2D.new()
	get_node("StaticBody2D").get_node("CollisionShape2D").shape.radius = radius

func _ready() -> void:
	global_position = global_position.snapped(Vector2(32,32))
	add_to_group("Planets")
