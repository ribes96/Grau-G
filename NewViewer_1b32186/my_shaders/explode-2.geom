#version 330 core

layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
in vec3 N[];
out vec4 gfrontColor;

uniform mat4 modelViewProjectionMatrix;
uniform float time;

const float speed = 1.2;
const float angSpeed = 8.0;


void main( void )
{
    vec3 prom = (N[0] + N[1] + N[2]) / 3;
    vec4 baricenter = (
        gl_in[0].gl_Position +
        gl_in[1].gl_Position +
        gl_in[2].gl_Position
        ) / 3;
    vec3 transVec = speed * time * prom;
	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vfrontColor[i];
        vec4 nV = gl_in[i].gl_Position + vec4(transVec,.0);
		gl_Position = modelViewProjectionMatrix * nV;
		EmitVertex();
	}
    EndPrimitive();
}
