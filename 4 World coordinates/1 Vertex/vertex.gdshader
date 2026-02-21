shader_type canvas_item;

varying vec2 vertex_varying;
// COLOR and VERTEX main different things in vertex() and fragment()
void vertex() {
	//VERTEX.x += sin(VERTEX.y * 10.) * 40.;
	vertex_varying = VERTEX;
	COLOR = vec4(UV.x, 0., 0., 1.);
}

void fragment() {
	COLOR.a = 1.;
	//COLOR.rgb = vec3(vertex_varying.x, vertex_varying.y, 0.);
	//COLOR.rgb = vec3(VERTEX.x * SCREEN_PIXEL_SIZE.x, VERTEX.y * SCREEN_PIXEL_SIZE.y, 0.);
}