class_name MusicString extends Node2D

var root: Types.Pitch
var planet1: Node2D
var planet2: Node2D
var half_sized: bool
var area = Area2D.new()
var collision_shape = CollisionShape2D.new()
var line_container: Node2D

func _ready() -> void:
	collision_shape.shape = SegmentShape2D.new()
	add_child(area)
	area.add_child(collision_shape)
	add_to_group("Strings")
	area.body_entered.connect(_on_area_2d_body_entered)

func _draw() -> void:
	if line_container:
		line_container.queue_free()
	line_container = Node2D.new()
	var new_position1 = planet1.position
	var new_position2 = planet2.position
	if half_sized:
		new_position2 = Vector2((planet2.position.x+planet1.position.x)/2, (planet2.position.y+planet1.position.y)/2)
	collision_shape.shape.a = new_position1
	collision_shape.shape.b = new_position2
	line_container.draw.connect(_draw_line.bind(line_container, Types.pitch_to_color(root), new_position1, new_position2))
	add_child(line_container)

func _draw_line(node: Node2D, color: Color, position1: Vector2, position2: Vector2):
	node.draw_line(position1, position2, color, 4, true)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Ship"):
		get_parent().get_node("SharedComponents").play_pitch(root)
		play_sound.emit(self)
		
signal play_sound(music_string: MusicString)
