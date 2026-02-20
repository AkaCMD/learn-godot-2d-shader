shader_type canvas_item;

const vec2 center = vec2(0.5, 0.5);
uniform float radius: hint_range(0.0, 1.0) = 0.5;
uniform float width: hint_range(0.0, 1.0) = 0.5;
uniform vec2 highlight_center;
uniform float highlight_alpha: hint_range(0.0, 1.0) = 0.5;
uniform vec3 main_color: source_color;
uniform vec3 highlight_color: source_color;
uniform float glow: hint_range(0.0, 1.0) = 0.8;
uniform sampler2D noise: repeat_enable;

void vertex() {
	VERTEX += normalize(VERTEX) * 50. * sin(TIME) * 0.1;
}

void fragment() {
	// main shape
	float circle_main = step(distance(UV, center), radius);
	float circle_inner = smoothstep(width * 0.5, 1, distance(UV, center));
	float main_shape = circle_main * circle_inner;
	
	// highlight shape
	float hightlight_shape = pow(1. - distance(highlight_center, UV), 3.) * highlight_alpha * main_shape;
	
	// colors
	vec3 color = main_color * main_shape + highlight_color * hightlight_shape;
	color *= vec3(1. + glow * 5.);
	
	// texture
	float texture_alpha = texture(noise, UV + vec2(TIME * 0.1, 0.)).r * 3.;
	
	COLOR.a = (hightlight_shape + main_shape) * texture_alpha;
	COLOR.rgb = color;
}