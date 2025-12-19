extends CharacterBody2D

const SPEED = 250
const TURN_SPEED = 4


func _draw() -> void:
	var triangle: PackedVector2Array = PackedVector2Array([Vector2(0,-16),Vector2(9,11),Vector2(-9,11)])
	draw_colored_polygon(triangle, Color.BLUE)
	get_node("CollisionPolygon2D").polygon = triangle


func _process(delta: float) -> void:
	if (Input.is_action_pressed("turn_right")):
		rotate(TURN_SPEED * delta)
	if (Input.is_action_pressed("turn_left")):
		rotate(-TURN_SPEED * delta)
	if (Input.is_action_pressed("move_forward")):
		move_and_collide(Vector2(0,-SPEED * delta).rotated(rotation))
	if (Input.is_action_pressed("move_back")):
		move_and_collide(Vector2(0,SPEED * delta/2)).rotated(rotation)
