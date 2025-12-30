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
	area.body_entered.connect(_on_area_2d_body_entered)

func _draw() -> void:
	draw_line(planet1.position, planet2.position, Types.pitch_to_color(root), 5)

func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	print_debug("yes")
	if body.is_in_group("Ship"):
		get_parent().get_node("SharedComponents").play_pitch(root)
