varying mediump vec4 var_position;
varying mediump vec2 var_texcoord0;

uniform lowp sampler2D tex_metaball;
uniform lowp sampler2D tex_base;

void main()
{
	vec4 metaball = texture2D(tex_metaball, var_texcoord0.xy);
	vec4 base = texture2D(tex_base, var_texcoord0.xy);

	float threshold = 0.99;
	
	if (metaball.a > threshold) {
		metaball = vec4(0.5,0.7,1,0.7);
	}
	else {
		metaball = vec4(0,0,0,1);
	}

	base += metaball;
	gl_FragColor = base;
}

