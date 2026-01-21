@tool
extends Node2D
@export var radius: int
@export var atmosphere_radius: int
@export var root: Types.Pitch
@export var is_active: bool
@export var activation_sequence: Array[Types.Pitch]
var activation_sequence_index: int = 0
var planet_container = Node2D.new()
var atmosphere_container = Node2D.new()
var rect_container
var sequence_container: Array[Node2D]

func _draw() -> void:
	#global_position = global_position.snapped(Vector2(32,32))
	z_index = 1
	atmosphere_container.z_index = -1
	#planet_container.z_index = 1
	var atmosphere_color = Types.pitch_to_color(root)
	atmosphere_color.a = .2
	#draw_circle(Vector2.ZERO, atmosphere_radius, atmosphere_color, true, -1.0, true)
	draw_circle(Vector2.ZERO, radius, Types.pitch_to_color(root), true, -1.0, true)
	planet_container.draw.connect(_draw_circle.bind(planet_container, Types.pitch_to_color(root), radius))
	atmosphere_container.draw.connect(_draw_circle.bind(atmosphere_container, atmosphere_color, atmosphere_radius))
	add_child(planet_container)
	add_child(atmosphere_container)
	get_node("StaticBody2D").get_node("CollisionShape2D").shape = CircleShape2D.new()
	get_node("StaticBody2D").get_node("CollisionShape2D").shape.radius = radius
	var rect = Rect2(-Vector2(radius/4, radius/4), Vector2(radius/2,radius/2))
	rect_container = Node2D.new()
	rect_container.draw.connect(_draw_rect.bind(rect_container, rect, Color.WHITE))
	if !is_active:
		rect_container.modulate = Color(0.5,0.5,0.5,1)
	add_child(rect_container)
	if !activation_sequence.size() > 0:
		rect_container.visible = false
	for pitch_ind in activation_sequence.size():
		var new_node = Node2D.new()
		sequence_container.append(new_node)
		new_node.draw.connect(_draw_circle.bind(new_node, Types.pitch_to_color(activation_sequence[pitch_ind]), 3, 1))
		add_child(new_node)
		new_node.position = Vector2(pitch_ind * 10 - (activation_sequence.size()-1) * 5, 0)
		#if !is_active:
			#new_node.modulate = Color(1,1,1,0.3)

func _ready() -> void:
	#global_position = global_position.snapped(Vector2(32,32))
	add_to_group("Planets")

func _draw_circle(node: Node2D, color: Color, radius: int, border_radius: int = 0) -> void:
	if border_radius > 0:
		node.draw_circle(Vector2.ZERO, radius+border_radius, Color.BLACK, true, -1.0, true)
	node.draw_circle(Vector2.ZERO, radius, color, true, -1.0, true)

func _draw_rect(node: Node2D, rect: Rect2, color: Color) -> void:
	node.draw_rect(rect, color)

func respond_to_sound(pitch: Types.Pitch) -> void:
	if activation_sequence_index < activation_sequence.size() and activation_sequence[activation_sequence_index] != pitch:
		#if is_active:
		for node in sequence_container:
			node.modulate = Color(1,1,1,1)
		#else:
			#for node in sequence_container:
				#node.modulate = Color(1,1,1,0.3)
		activation_sequence_index = 0
		return
	if activation_sequence_index == activation_sequence.size() - 1:
		if is_active:
			rect_container.modulate = Color(0.5,0.5,0.5,1)
		else:
			rect_container.modulate = Color(1,1,1,1)
		#if is_active:
			#sequence_container[activation_sequence_index].modulate = Color(1,1,1,0.3)
		#else:
			#sequence_container[activation_sequence_index].modulate = Color(1,1,1,1)
		for node in sequence_container:
			node.modulate = Color(1,1,1,1)
		is_active = !is_active
		activation_sequence_index = 0
		#rect_container.visible = !rect_container.visible
		#for node in sequence_container:
			#node.visible = !node.visible
		#planet_container.queue_free()
		#atmosphere_container.queue_free()
		#rect_container.queue_free()
		#queue_redraw()
		return
	if activation_sequence_index < activation_sequence.size():
		#if is_active:
		sequence_container[activation_sequence_index].modulate = Color(1,1,1,0.3)
		activation_sequence_index += 1
		#else:
			#sequence_container[activation_sequence_index].modulate = Color(1,1,1,1)
			#activation_sequence_index += 1
		return
