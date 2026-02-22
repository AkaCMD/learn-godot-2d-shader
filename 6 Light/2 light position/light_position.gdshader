shader_type canvas_item;

uniform float progress: hint_range(0.0, 20.0);
uniform float width: hint_range(0.0, 1.0);

uniform float cell_size = 20.;
uniform float gap = 10.;
uniform float radius = 5.;

void light() {
	vec2 center_pos = (LIGHT_VERTEX.xy - LIGHT_POSITION.xy) * 0.01;
	float circle = step(progress, length(center_pos));
	float small_circle = step(progress - width, length(center_pos));
	float cutout = small_circle - circle;
	
	// grid
	float grid = step(gap, mod(LIGHT_VERTEX.x, cell_size)) * step(gap, mod(LIGHT_VERTEX.y, cell_size));
	
	// dots
	float dots = step(length(mod(LIGHT_VERTEX.xy, vec2(cell_size)) - vec2(cell_size/2.)), radius);
	
	//LIGHT = vec4(center_pos.x, center_pos.y, 0, 1.);
	float side = grid * float(LIGHT_DIRECTION.x > 0.) + dots * float(LIGHT_DIRECTION.x < 0.);
	LIGHT = vec4(COLOR.rgb * LIGHT_COLOR.rgb * LIGHT_ENERGY, LIGHT_COLOR.a * side * cutout);
}
