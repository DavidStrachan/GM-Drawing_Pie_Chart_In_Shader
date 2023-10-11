

// THIS MIGHT LOOK A LITTLE CONFUSING PASSING IN ALL THE UVs BUT IT MEANS SPRITES DONT NEED TO BE ON THEIR OWN TEXTURE PAGE

var _shader_name = shad_image_in

image_1 = spr_pie1
image_2 = spr_pie2


var i = 0
shader_params[i++] = shader_get_uniform(_shader_name, "u_imageIn1_uvs")
shader_params[i++] = shader_get_uniform(_shader_name, "u_imageIn2_uvs")
shader_params[i++] = shader_get_uniform(_shader_name, "u_angle_start")
shader_params[i++] = shader_get_uniform(_shader_name, "u_angle_end")
//shader_params[i++] = shader_get_uniform(_shader_name, "u_time_as_decimal_1")
//shader_params[i++] = shader_get_uniform(_shader_name, "u_time_as_decimal_2")
//shader_params[i++] = shader_get_uniform(_shader_name, "u_time_as_decimal_3")


// Images to send to shader	(WARN: must be on own texture page)
var i = 0

shader_sampler[i] = shader_get_sampler_index(_shader_name, "s_imageIn1") // name of what you want it to be called in the shader
shader_image[i++] = sprite_get_texture(image_1,0) // surface_get_texture() or sprite_get_texture()

shader_sampler[i] = shader_get_sampler_index(_shader_name, "s_imageIn2") // name of what you want it to be called in the shader
shader_image[i++] = sprite_get_texture(image_2,0) // surface_get_texture() or sprite_get_texture()

//shader_sampler[i] = shader_get_sampler_index(_shader_name, "s_mask") // name of what you want it to be called in the shader
//shader_image[i++] = sprite_get_texture(spr_mask,0) // surface_get_texture() or sprite_get_texture()

// All sprites passed into the shader needs to have UVs set for them
var i = 0

var _sprite = image_1 
var _index = 0 
var _uvs = sprite_get_uvs(_sprite, _index);
shader_image_uvs[i++] = [_uvs[0],_uvs[1],_uvs[2],_uvs[3],sprite_get_width(_sprite),sprite_get_height(_sprite)]	// Where these images are on the texture page

var _sprite = image_2 
var _index = 0 
var _uvs = sprite_get_uvs(_sprite, _index);
shader_image_uvs[i++] = [_uvs[0],_uvs[1],_uvs[2],_uvs[3],sprite_get_width(_sprite),sprite_get_height(_sprite)]	// Where these images are on the texture page

