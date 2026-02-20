extends Node2D

func _ready() -> void:
	#$Icon.material.set_shader_parameter('Color', Color.AQUAMARINE)
	var tween = create_tween()
	tween.set_loops()
	#tween.tween_property($Icon.material, 'shader_parameter/Color', Color.DODGER_BLUE, 3)
	tween.tween_property($Icon.material, 'shader_parameter/Size', 0.1, 1)
	tween.tween_property($Icon.material, 'shader_parameter/Size', 0.5, 1)
	tween.tween_property($Icon.material, 'shader_parameter/Offset', Vector2(100, 0), 1)
	tween.tween_property($Icon.material, 'shader_parameter/Offset', Vector2.ZERO, 1)
