shader_type canvas_item;

uniform float center_size: hint_range(0.0, 1.0) = 0.5;
uniform float circle_width: hint_range(0.0, 1.0) = 0.5;
uniform float circle_distance: hint_range(0.0, 1.0) = 0.5;
uniform float interval_width: hint_range(0.0, 1.0) = 0.1;
uniform float crosshair_length: hint_range(0.0, 1.0) = 0.5;
uniform float crosshair_height: hint_range(0.0, 1.0) = 0.5;
uniform float crosshair_distance: hint_range(0.0, 1.0) = 0.25;

float create_circles(vec2 uv){
	float circle = step(distance(uv, vec2(0.5)), center_size * 0.1);
	float outer_circle = step(distance(uv, vec2(0.5)), circle_distance);
	float inner_circle = step(distance(uv, vec2(0.5)), circle_distance - circle_width);
	float cross_cutout = step(distance(uv.x, 0.5), interval_width) + step(distance(uv.y, 0.5), interval_width);
	return circle + max((outer_circle - inner_circle) - cross_cutout, 0);
}

float create_lines(vec2 uv){
	vec2 center_distance = vec2(0.5) + crosshair_distance;
	float h_width = step(distance(uv.x, center_distance.x), crosshair_length * 0.25) 
					+ step(distance(1. - uv.x, center_distance.x), crosshair_length * 0.25);
	float h_height = step(distance(uv.y, 0.5), crosshair_height * 0.02);
	float v_height = step(distance(uv.y, center_distance.y), crosshair_length * 0.25) 
					+ step(distance(1. - uv.y, center_distance.y), crosshair_length * 0.25);
	float v_width = step(distance(uv.x, 0.5), crosshair_height * 0.02);
	return h_width * h_height + v_height * v_width;
}

void fragment() {
	COLOR.rgb = vec3(1);
	COLOR.a = create_lines(UV) + create_circles(UV);
}