#version 330 core

in vec4 frontColor;
in vec4 gl_FragCoord;
// in vec4 gl_Position;
out vec4 fragColor;
// out float gl_FragDepth;

void main()
{
    fragColor = frontColor;
    gl_FragDepth = -gl_FragCoord.z;
    // gl_FragDepth = -1*gl_Position.z;
}
