varying mediump vec4 var_position;
varying mediump vec2 var_texcoord0;

uniform lowp sampler2D tex_metaball;
uniform lowp sampler2D tex_base;
uniform lowp vec4 color;
uniform lowp vec4 colorSurface;

void main()
{
	vec4 metaball = texture2D(tex_metaball, var_texcoord0.xy);
	vec4 base = texture2D(tex_base, var_texcoord0.xy);

	float thresholdWater = 0.9;
	float thresholdSurface = 0.6;
	
	if (metaball.a > thresholdWater) {
		metaball = color;
	}
	else if (metaball.a > thresholdSurface) {
		metaball = colorSurface;
	}
	else {
		metaball = vec4(0.0,0.0,0.0,1.0);
	}

	base += metaball;
	gl_FragColor = base;
}

