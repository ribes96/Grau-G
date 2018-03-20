#version 330 core

in vec4 frontColor;
in vec3 fN;
in vec3 fV;
out vec4 fragColor;

uniform float epsilon = 0.1;
uniform float light = 0.5;

void main()
{

    vec4 resColor = vec4(0.7,0.6,0.0, 1.0);
    float value = dot(normalize(fN),normalize(fV));
    if (-epsilon < value && value < epsilon)
        fragColor = resColor;
    else fragColor = frontColor * light * normalize(fN).z;
}
