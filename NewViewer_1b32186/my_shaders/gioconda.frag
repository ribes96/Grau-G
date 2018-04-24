#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

uniform float time;
uniform sampler2D sampler;


void main()
{
    fragColor = frontColor;
    vec2 eyeCenter = vec2(0.393, 0.652);
    vec2 lipOffset = vec2(0.057, -0.172);
    fragColor = texture(sampler, vtexCoord);
    if (fract(time) <= 0.5 && length(eyeCenter - vtexCoord) < 0.025)
        fragColor = texture(sampler, vtexCoord + lipOffset);
}
