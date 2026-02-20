extends Node2D

#func _ready() -> void:
	#var window_size: Vector2 = DisplayServer.window_get_size()
	#$CanvasLayer/ColorRect.material.set_shader_parameter('ratio', window_size.x / window_size.y)
	#$Sprite2D.material.set_shader_parameter('ratio', 2.);
	#print(window_size.x / window_size.y)

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		var tween = create_tween()
		tween.tween_property($CanvasLayer/ColorRect.material, 'shader_parameter/size', 0, 1).from(1)
	if Input.is_action_just_pressed("ui_cancel"):
		var tween = create_tween()
		tween.tween_property($CanvasLayer/ColorRect.material, 'shader_parameter/size', 1, 1).from(0)
