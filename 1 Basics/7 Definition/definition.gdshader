shader_type canvas_item;

uniform float progress: hint_range(0.0, 1.0);

// In parallel, a shader updates the position of vertices and then the color & alpha
// values of every fragment

void vertex(){
	VERTEX += vec2(50, 0) * step(progress, UV.y);
}

void fragment() {
	float y_pos = step(0.5, UV.y);
	COLOR.rgb = vec3(y_pos);
}
