extends CharacterBody2D

const ACCELERATION = 1000
const MAX_SPEED = 50000
const TURN_SPEED = 3

func _ready() -> void:
	z_index = 1
	add_to_group("Ship")

func _draw() -> void:
	var triangle: PackedVector2Array = PackedVector2Array([Vector2(0,-16),Vector2(9,11),Vector2(-9,11)])
	draw_colored_polygon(triangle, Color.DARK_GRAY)
	get_node("CollisionPolygon2D").polygon = triangle

func _process(delta: float) -> void:
	#print_debug(global_position)
	if (Input.is_action_pressed("turn_right")):
		rotate(TURN_SPEED * delta)
	if (Input.is_action_pressed("turn_left")):
		rotate(-TURN_SPEED * delta)
	if (Input.is_action_pressed("move_forward")):
		velocity += Vector2(0,-ACCELERATION * delta).rotated(rotation)
	if (Input.is_action_pressed("move_back")):
		velocity += Vector2(0,ACCELERATION * delta/2).rotated(rotation)
	if velocity.length() > MAX_SPEED*delta:
		velocity = velocity.normalized()*MAX_SPEED*delta
	if (!Input.is_action_pressed("move_back") or !Input.is_action_pressed("move_forward")):
		velocity = velocity.lerp(Vector2.ZERO,.03)
	move_and_slide()
