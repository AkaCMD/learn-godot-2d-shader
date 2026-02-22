shader_type canvas_item;

uniform float line_count: hint_range(0.0, 50.0) = 20.;
uniform float line_width: hint_range(0.0, 1.0) = 0.5;
uniform float speed: hint_range(0.0, 1.0) = 0.5;
uniform float wobbling_speed: hint_range(0.0, 3.) = 1.5;
uniform float wave_amplitude: hint_range(0.0, 50.0) = 10.0;
uniform float pixel_size = 64.;

vec3 hsv2rgb(float hue){
	vec3 k = vec3(1., 2./3., 1./3.); // color wheel 0, 120, 240
	vec3 p = abs(fract(vec3(hue) + k) * 6. - 3.);
	return clamp(p - vec3(1.), 0, 1.);
}

void vertex() {
	VERTEX.x += sin(VERTEX.y * 0.05 + TIME * wobbling_speed) * wave_amplitude;
}

void fragment() {
	vec2 pixel_uv = floor(UV * pixel_size) / pixel_size;
	float diagonal_position = pixel_uv.x + pixel_uv.y;
	float moving_position = diagonal_position - (TIME * speed);
	float pattern = fract(diagonal_position * line_count);
	vec3 rainbow = hsv2rgb(moving_position);
	float is_line = float(pattern < line_width);
	COLOR.rgb = mix(COLOR.rgb, rainbow, is_line);
}
