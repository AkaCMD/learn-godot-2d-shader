shader_type canvas_item;

uniform float rot_x: hint_range(0.0, 1.0) = 0.;
uniform float rot_y: hint_range(0.0, 1.0) = 0.;
uniform float rot_z: hint_range(0.0, 1.0) = 0.;
uniform vec2 pivot;

void vertex() {
	// 3D rotation matrices
	mat3 rot_x_mat = mat3(
		vec3(1., 0, 0),
		vec3(0, cos(rot_x*TAU), sin(rot_x*TAU)),
		vec3(0, -sin(rot_x*TAU), cos(rot_x*TAU))
	);
	mat3 rot_y_mat = mat3(
		vec3(cos(rot_y*TAU), 0, -sin(rot_y*TAU)),
		vec3(0, 1., 0),
		vec3(sin(rot_y*TAU), 0, cos(rot_y*TAU))
	);
	mat3 rot_z_mat = mat3(
		vec3(cos(rot_z*TAU), sin(rot_z*TAU), 0),
		vec3(sin(rot_z*TAU), cos(rot_z*TAU), 0),
		vec3(0, 0, 1.)
	);
	
	mat3 rot_matrix = rot_x_mat * rot_y_mat * rot_z_mat;
	//VERTEX = (rot_matrix * vec3(VERTEX, 1.)).xy;
	
	// pivot point
	vec3 v = vec3(VERTEX, 1.) - vec3(pivot, 1.);
	v = rot_matrix * v;
	v += vec3(pivot, 1.);
	VERTEX = v.xy;
}
