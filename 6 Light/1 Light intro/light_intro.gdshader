shader_type canvas_item;

uniform float progress: hint_range(0.0, 1.0);
uniform float speed: hint_range(0.0, 1.0);

void light() {
	float t = TIME * speed;
	mat3 rotation_matrix = mat3(
		vec3(cos(t), -sin(t), 0),
		vec3(sin(t), cos(t), 0),
		vec3(0, 0, 1)
	);
	vec3 rotated_light = rotation_matrix * LIGHT_DIRECTION;
	float mask = step(progress, abs(rotated_light.x));
	LIGHT = vec4(COLOR.rgb * LIGHT_COLOR.rgb * LIGHT_ENERGY * mask, LIGHT_COLOR.a);
}
