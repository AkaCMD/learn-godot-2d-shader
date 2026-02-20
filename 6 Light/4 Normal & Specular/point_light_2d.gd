extends PointLight2D



func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		print(event.position)
		position = event.position - Vector2(1920,1080) / 2
#
#func _process(_delta: float) -> void:
	#print(get_local_mouse_position())
	#position = get_local_mouse_position()
