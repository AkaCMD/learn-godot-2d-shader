shader_type canvas_item;

//uniform float size: hint_range(0.0, 0.5, 0.1);
//uniform vec3 color: source_color;
uniform float progress: hint_range(0.0, 1.0, 0.1);
uniform sampler2D test_texture;

void fragment() {
	//float circle = distance(UV, vec2(0.5));
	//COLOR.a = 1. - step(size, circle);
	//COLOR.rgb = color;
	float diagonal = (UV.x + UV.y) / 2.;
	COLOR.a *= step(diagonal, progress);
	//vec4 test = texture(test_texture, UV);
	//COLOR.rgb = test.xyz;
}