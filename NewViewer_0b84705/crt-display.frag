#version 330 core

in vec4 frontColor;
in vec4 gl_FragCoord;

out vec4 fragColor;



uniform int n = 2;

void main()
{
    // vec4 my_pos = gl_FragCoord - vec4(0.5);
    if (mod(gl_FragCoord.y, n) != 0.5 )
        discard;
    fragColor = frontColor;
}
