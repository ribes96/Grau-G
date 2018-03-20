#version 330 core

in vec4 frontColor;
in vec3 my_normal;
in vec4 vpos;

out vec4 fragColor;

void main()
{
    vec3 dx = dFdx(vpos.xyz);
    vec3 dy = dFdy(vpos.xyz);
    vec3 N = normalize(cross(dx,dy));
    fragColor = frontColor * N.z;
}
