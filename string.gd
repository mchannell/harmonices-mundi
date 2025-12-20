class_name MusicString extends Node2D

var root: Types.Pitch
var planet1: Node2D
var planet2: Node2D
var area = Area2D.new()
var collision_shape = CollisionShape2D.new()

func _ready() -> void:
	collision_shape.shape = SegmentShape2D.new()
	collision_shape.shape.a = planet1.position
	collision_shape.shape.b = planet2.position
	add_child(area)
	area.add_child(collision_shape)
	add_to_group("Strings")

func _draw() -> void:
	draw_line(planet1.position, planet2.position, Color.PURPLE,10)

func _process(delta: float) -> void:
	pass
