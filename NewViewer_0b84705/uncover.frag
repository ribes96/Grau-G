#version 330 core

// in vec4 frontColor;
in vec4 gl_FragCoord;
out vec4 fragColor;
in vec3 ndc;

uniform float time;

void main()
{
    // fragColor = frontColor;
    if (2*ndc.x > time) discard;
    else fragColor = vec4(0.,0.,1.,0.);
}
