extends StaticBody2D


func _draw() -> void:
	draw_circle(Vector2(0,0),96,Color.RED)
	get_node("CollisionShape2D").shape.radius = 96
