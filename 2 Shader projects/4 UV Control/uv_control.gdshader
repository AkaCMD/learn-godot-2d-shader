shader_type canvas_item;

uniform float x: hint_range(0.0, 1.0);

void fragment() {
	// scale & position
	//vec2 scaled_uv = UV * 2. - vec2(x, 0.1);
	//vec4 scaled_texture = texture(TEXTURE, scaled_uv);
	//vec2 mask = step(vec2(0), scaled_uv) * step(scaled_uv, vec2(1));
	//scaled_texture.a *= mask.x * mask.y;
	//COLOR = scaled_texture;
	
	// centering
	//vec2 uv = 2. * UV - 1.;
	////COLOR.a = step(length(uv), 0.5);
	//COLOR.a = step(distance(abs(uv.x), 0.5), 0.1);
	//COLOR.rgb = vec3(uv, 0);
	
	// pixelate
	//vec2 grid = vec2(24., 24.);
	//vec2 pixel_uv = floor(UV * grid) / grid;
	//COLOR.rgb = vec3(pixel_uv, 0);
	//COLOR.rgb = texture(TEXTURE, pixel_uv).rgb;
	
	// checkerboard
	//vec2 grid = floor(UV * 4.);
	//float checker = mod(grid.x + grid.y, 2.);
	//COLOR.a = checker;
	//COLOR.rgb = vec3(grid, 0);
}