#version 330 core

layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

uniform mat4 modelViewProjectionMatrix;
uniform vec3 boundingBoxMin; // cantonada mínima de la capsa englobant


void main( void )
{
	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vfrontColor[i];
		gl_Position = modelViewProjectionMatrix * gl_in[i].gl_Position;
		EmitVertex();
	}
    EndPrimitive();

    for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vec4(0.0);
        vec4 pos = gl_in[i].gl_Position;
        pos.y = boundingBoxMin.y;
        gl_Position = modelViewProjectionMatrix * pos;
		EmitVertex();
	}
    EndPrimitive();
}
