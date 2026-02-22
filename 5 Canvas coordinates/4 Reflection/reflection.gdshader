shader_type canvas_item;

uniform sampler2D screen_texture: hint_screen_texture;
uniform vec3 color: source_color;

void fragment() {
	vec3 screen_color = texture(screen_texture, SCREEN_UV).rgb;
	float water_a = float(screen_color == vec3(1.,0,0));
	float coast_a = float(screen_color == vec3(0,1.,0));
	COLOR.a *= water_a * 0.5 + coast_a * 0.3;
	COLOR.rgb = mix(COLOR.rgb, color, 0.2);
}
