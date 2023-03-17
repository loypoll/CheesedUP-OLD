varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 color1;
uniform vec3 color2;

void main()
{
	// sugary spire reference
    vec4 color = vec4(texture2D(gm_BaseTexture, v_vTexcoord));
	if ((color.r + color.g + color.b) > 0.01)
		color.rgb = color1;
	else
		color.rgb = color2;
	gl_FragColor = v_vColour * color;
}
