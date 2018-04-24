#version 330 core

in vec4 frontColor;
out vec4 fragColor;

in vec3 fN;
in vec3 fL;
in vec3 fH;


uniform vec4 lightAmbient; // similar a gl_LightSource[0].ambient
uniform vec4 lightDiffuse; // similar a gl_LightSource[0].diffuse
uniform vec4 lightSpecular; // similar a gl_LightSource[0].specular
uniform vec4 matAmbient; // similar a gl_FrontMaterial.ambient
uniform vec4 matDiffuse; // similar a gl_FrontMaterial.diffuse
uniform vec4 matSpecular; // similar a gl_FrontMaterial.specular
uniform float matShininess; // similar a gl_FrontMaterial.shininess


void main()
{
    vec3 N = normalize(fN);
    vec3 L = normalize(fL);
    vec3 H = normalize(fH);

    float ldiff = max(0.0,dot(N,L));
    float lspec = 0;
    if (ldiff > 0) lspec = pow(max(0.0,dot(N,H)),matShininess);

    vec4 ambient = matAmbient * lightAmbient;
    vec4 diffuse = matDiffuse * lightDiffuse * ldiff;
    vec4 specular=matSpecular*lightSpecular * lspec;
    fragColor = ambient + diffuse + specular;
}
