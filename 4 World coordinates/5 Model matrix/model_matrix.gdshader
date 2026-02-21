shader_type canvas_item;

varying vec2 world_pos;

void vertex() {
	world_pos = (MODEL_MATRIX * vec4(VERTEX, 0, 1.)).xy;
}

void fragment() {
	COLOR.rgb = vec3(world_pos, 0);
}
