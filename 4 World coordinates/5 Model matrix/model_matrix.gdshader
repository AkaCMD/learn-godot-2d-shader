shader_type canvas_item;

uniform float radius: hint_range(0.0, 300.0);
uniform vec2 circle_center = vec2(100, 150);
uniform sampler2D space_texture: repeat_enable;
uniform float amount: hint_range(0.0, 1.0);
varying vec2 world_pos;

void vertex() {
	world_pos = (MODEL_MATRIX * vec4(VERTEX, 0, 1.)).xy;
}

void fragment() {
	//COLOR.rgb = vec3(world_pos, 0);
	//COLOR.a = step(radius, distance(world_pos, circle_center));
	vec4 space_color = texture(space_texture, world_pos * TEXTURE_PIXEL_SIZE * 0.1);
	COLOR.rgb = mix(COLOR.rgb, space_color.rgb, amount);
}
