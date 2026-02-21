shader_type canvas_item;

uniform sampler2D scale_curve;
uniform float speed: hint_range(0.0, 5.0);

void vertex() {
	//VERTEX.x += sin(TIME) * 20.; // -1 -> 1
	//float normalized_curved = 0.5 * (1. + sin(TIME)); // 0 -> 1
	float curve_forward = fract(TIME * speed);
	float curve_output = texture(scale_curve, vec2(curve_forward, 0.)).r;
	VERTEX *= (1. + curve_output);
}

void fragment() {
	COLOR.rgb = texture(scale_curve, UV).rgb;
}
