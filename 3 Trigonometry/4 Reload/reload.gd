extends Node2D

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		var tween = create_tween()
		tween.tween_property($Sprite2D.material, 'shader_parameter/charge',1.0, 0.4)
		tween.tween_interval(0.5)
		tween.tween_property($Sprite2D.material, 'shader_parameter/reload',1.0, 1.5)
		tween.tween_callback(shader_reset)


func shader_reset():
	$Sprite2D.material.set_shader_parameter('charge', 0.0)
	$Sprite2D.material.set_shader_parameter('reload', 0.0)
