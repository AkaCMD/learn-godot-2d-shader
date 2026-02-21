shader_type canvas_item;

uniform float earth_radius: hint_range(0.005, 0.2) = 0.1;
uniform float moon_radius: hint_range(0.005, 0.2) = 0.05;
uniform float meteor_radius: hint_range(0.005, 0.2) = 0.02;
uniform vec3 earth_color: source_color;
uniform vec3 moon_color: source_color;
uniform vec3 meteor_color: source_color;

uniform float moon_distance: hint_range(0.0, 0.5) = 0.4;
uniform float meteor_distance: hint_range(0.0, 0.5) = 0.1;

void fragment() {
	vec2 uv = 2. * UV - 1.;
	
	// earth
	float earth_mask = step(length(uv), earth_radius);
	COLOR.a = earth_mask;
	COLOR.rgb = mix(COLOR.rgb, earth_color, earth_mask);
	
	// moon
	float moon_x = cos(TIME) * moon_distance;
	float moon_y = sin(TIME) * moon_distance;
	vec2 moon_center = vec2(moon_x, moon_y);
	float moon_mask = step(distance(uv, moon_center), moon_radius);
	COLOR.a += moon_mask;
	COLOR.rgb = mix(COLOR.rgb, moon_color, moon_mask);
	
	// exercise -> meteor
	float meteor_x = moon_center.x + cos(-TIME * 2.) * meteor_distance;
	float meteor_y = moon_center.y + sin(-TIME * 2.) * meteor_distance;
	vec2 meteor_center = vec2(meteor_x, meteor_y);
	float metoer_mask = step(distance(uv, meteor_center), meteor_radius);
	COLOR.a += metoer_mask;
	COLOR.rgb = mix(COLOR.rgb, meteor_color, metoer_mask);
}
