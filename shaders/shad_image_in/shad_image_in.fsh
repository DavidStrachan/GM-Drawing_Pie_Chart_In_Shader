
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

// These tell us where on the texture page the sprites are we want to draw
uniform float u_imageIn1_uvs [6];		// Left, Top, Right, Bottom, Width, Height
uniform float u_imageIn2_uvs [6];		// Left, Top, Right, Bottom, Width, Height

uniform float u_angle_start;
uniform float u_angle_end;

uniform sampler2D s_imageIn1;	// This is where the texture gets passed in 
uniform sampler2D s_imageIn2;	// This is where the texture gets passed in 


float lerp_long(float _input_min, float _input_max, float _output_min, float _output_max, float _amount) {
	return _output_min + (_amount - _input_min) * (_output_max - _output_min) / (_input_max - _input_min);
}

float pi = 3.14159265359;
float tau = pi * 2.0;

float _angle_1 = mod(u_angle_start,tau);
float _angle_2 = mod(u_angle_end,tau);
float _min_angle = min(_angle_1,_angle_2);
float _max_angle = max(_angle_1,_angle_2);
vec2 _center = vec2(0.5, 0.5); // Center of the image


void main()
{
		
	
    vec2 position = vec2(	lerp_long(u_imageIn1_uvs[0],u_imageIn1_uvs[2],0.0,1.0,v_vTexcoord.x),
							lerp_long(u_imageIn1_uvs[1],u_imageIn1_uvs[3],0.0,1.0,v_vTexcoord.y)) - _center;
    float angle = atan(position.y, position.x);
	


    // Normalize the angle to be between 0 and 2*pi
    if (angle < 0.0)
        angle += tau;
	
	vec4 image_out;	// We will store here the colour going out
	
	
	if (angle >= _min_angle && angle <= _max_angle)
	{
		image_out = texture2D( s_imageIn1, v_vTexcoord);	// Note: We are looking up the Sampler here
	}
	else 
	{
		
		// Work out the width and height as a decimal 
		float _imageIn2_width_dec = u_imageIn2_uvs[2] - u_imageIn2_uvs[0];
		float _imageIn2_height_dec = u_imageIn2_uvs[3] - u_imageIn2_uvs[1];
		vec2 _imageIn2_size_dec = vec2(_imageIn2_width_dec,_imageIn2_height_dec);
		
		vec2 use_pos = vec2(lerp_long(u_imageIn1_uvs[0],u_imageIn1_uvs[2],u_imageIn2_uvs[0],u_imageIn2_uvs[0]+_imageIn2_size_dec.x,v_vTexcoord.x),
							lerp_long(u_imageIn1_uvs[1],u_imageIn1_uvs[3],u_imageIn2_uvs[1],u_imageIn2_uvs[1]+_imageIn2_size_dec.y,v_vTexcoord.y));
							
		image_out = texture2D( s_imageIn2, use_pos);	// Note: We are looking up the Sampler here
	}


	
    gl_FragColor = v_vColour * image_out;
   
	
}
