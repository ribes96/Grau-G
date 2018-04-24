#version 330 core

in vec4 frontColor;
in vec4 gl_FragCoord;
// in vec4 gl_Position;
out vec4 fragColor;
// out float gl_FragDepth;




void main()
{
    fragColor = frontColor;
    gl_FragDepth = 1 - gl_FragCoord.z;
    //Tiene que estar entre [0,1]
}
