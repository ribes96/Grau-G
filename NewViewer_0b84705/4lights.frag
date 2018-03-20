#version 330 core

uniform mat4 modelViewMatrixInverse;

out vec4 fragColor;

in vec3 N;   	// normal (en object space)
in vec3 P; 	// posicio del vertex (en object space)

uniform float time;
uniform bool rotate = true;

// V, N, P, lightPos han d'estar al mateix espai de coordenades
// V �s el vector unitari cap a l'observador
// N �s la normal
// P �s la posici�
// lightPos �s la posici� de la llum
// lightColor �s el color de la llum
vec4 light(vec3 V, vec3 N, vec3 P, vec3 lightPos, vec3 lightColor)
{
	const float shininess = 100.0;
	const float Kd = 0.5;
	N = normalize(N);
	vec3 L = normalize(lightPos - P);
	vec3 R = reflect(-L, N);
	float NdotL = max(0.0, dot(N,L));
	float RdotV = max(0.0, dot(R,V));
	float spec =  pow( RdotV, shininess);
	return vec4(Kd*lightColor*NdotL + vec3(spec),0);
}

void main()
{
	float angle = 0;
	if (rotate) angle = time;
	mat3 rotMat = mat3(
		 cos(angle), sin(angle), 0,
		-sin(angle), cos(angle), 0,
		       0   ,       0   , 1
		);

	vec3 V = normalize(modelViewMatrixInverse[3].xyz - P);
	vec4 c = vec4(0);

	//

	vec3 light1 = vec3(0.0,10.0,0.0);
	vec3 light2 = vec3(0.0,-10.0,0.0);
	vec3 light3 = vec3(10.0,0.0,0.0);
	vec3 light4 = vec3(-10.0,0.0,0.0);

	vec3 colLight1 = vec3(0,1,0); // Green
	vec3 colLight2 = vec3(1,1,0); // Yellow
	vec3 colLight3 = vec3(0,0,1); // Blue
	vec3 colLight4 = vec3(1,0,0); // Red

	c += light(V, N, P, (modelViewMatrixInverse*vec4(rotMat*light1, 1)).xyz, colLight1);
	c += light(V, N, P, (modelViewMatrixInverse*vec4(rotMat*light2, 1)).xyz, colLight2);
	c += light(V, N, P, (modelViewMatrixInverse*vec4(rotMat*light3, 1)).xyz, colLight3);
	c += light(V, N, P, (modelViewMatrixInverse*vec4(rotMat*light4, 1)).xyz, colLight4);
	fragColor = c;
}
