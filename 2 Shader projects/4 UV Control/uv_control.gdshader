shader_type canvas_item;

uniform float x: hint_range(0.0, 1.0);

void fragment() {
	vec2 scaled_uv = UV * 2. - vec2(x, 0.1);
	vec4 scaled_texture = texture(TEXTURE, scaled_uv);
	vec2 mask = step(vec2(0), scaled_uv) * step(scaled_uv, vec2(1));
	scaled_texture.a *= mask.x * mask.y;
	COLOR = scaled_texture;
	//COLOR.rgb = vec3(scaled_uv, 0);
}