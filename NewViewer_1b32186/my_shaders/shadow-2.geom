#version 330 core

layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

uniform mat4 modelViewProjectionMatrix;
uniform vec3 boundingBoxMin; // cantonada mínima de la capsa englobant
uniform vec3 boundingBoxMax;


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

	if (gl_PrimitiveIDIn == 0)
	{
		gfrontColor = vec4(0,1,1,1); //Cian
		float posY = boundingBoxMin.y - 0.01;
		float R = length(boundingBoxMax - boundingBoxMin) / 2;
		vec3 C = (boundingBoxMax + boundingBoxMin) / 2;
		vec3 center = vec3(C.x, posY, C.z);

		gl_Position = modelViewProjectionMatrix * vec4(center.x + R, center.y, center.z + R, 1.0);
		EmitVertex();
		gl_Position = modelViewProjectionMatrix * vec4(center.x - R, center.y, center.z + R, 1.0);
		EmitVertex();
		gl_Position = modelViewProjectionMatrix * vec4(center.x + R, center.y, center.z - R, 1.0);
		EmitVertex();

		gl_Position = modelViewProjectionMatrix * vec4(center.x - R, center.y, center.z - R, 1.0);
		EmitVertex();

		EndPrimitive();
	}
}
