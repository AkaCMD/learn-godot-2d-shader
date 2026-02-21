shader_type canvas_item;

uniform float speed = 2.0;
uniform float frequency_y = 4.0;
uniform float amplitude_y = 40.;
uniform float frequency_x = 4.0;
uniform float amplitude_x = 10.;
uniform float incline: hint_range(0.0, 1.) = 1.;
uniform float max_incline = 40.;

void vertex() {
	VERTEX.x += cos((UV.y - TIME * speed) * frequency_x) * amplitude_x * UV.x;
	VERTEX.y += sin((UV.x + TIME * speed) * frequency_y) * amplitude_y * UV.x;
	VERTEX.x -= UV.y * incline * max_incline;
}

void fragment(){
	COLOR = vec4(1.);
	COLOR.a *= step(UV.x, 1.0) * step(0, UV.x) * step(UV.y, 1.) * step(0, UV.y);
}