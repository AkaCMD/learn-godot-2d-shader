shader_type canvas_item;

uniform float scale: hint_range(0.0, 3.0) = 1.;
uniform float speed: hint_range(0.0, 1.0);

void vertex(){
	mat3 scale_matrix = mat3(vec3(scale,0,0),vec3(0,scale,0),vec3(0,0,scale));
	float t = TIME * speed;
	mat3 rotation_matrix = mat3(
		vec3(cos(t), -sin(t), 0),
		vec3(sin(t), cos(t), 0),
		vec3(0, 0, 1)
	);
	VERTEX = (scale_matrix * rotation_matrix * vec3(VERTEX, 1)).xy;
}