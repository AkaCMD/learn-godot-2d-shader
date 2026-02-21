shader_type canvas_item;

uniform float x = 50.;
uniform float y = 50.;
uniform float scale = 2.;
uniform float rot: hint_range(0.0, 1.0);

void vertex() {
	mat3 translation_matrix = mat3(vec3(1,0,0), vec3(0,1,0), vec3(x,y,1));
	mat3 scale_matrix = mat3(vec3(scale,0,0),vec3(0,scale,0),vec3(0,0,scale));
	mat3 rotation_matrix = mat3(vec3(cos(rot*TAU),-sin(rot*TAU),0.), vec3(sin(rot*TAU),cos(rot*TAU),0),vec3(0,0,1.));
	vec3 result = translation_matrix * scale_matrix * rotation_matrix * vec3(VERTEX, 1.);
	VERTEX = result.xy;
}
