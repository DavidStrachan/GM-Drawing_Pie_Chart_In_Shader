draw_set_colour(c_green)
draw_set_alpha(1)



shader_set(shad_image_in)
	
	var i = 0;
	shader_set_uniform_f_array(shader_params[i],shader_image_uvs[i]); i++
	shader_set_uniform_f_array(shader_params[i],shader_image_uvs[i]); i++
	shader_set_uniform_f(shader_params[i],(current_time/1000) mod (pi * 2)); i++
	shader_set_uniform_f(shader_params[i],(current_time/1360) mod (pi * 2)); i++
	//shader_set_uniform_f(shader_params[i++],(current_time / 12000) mod 0.93)


	var i = 0;
	texture_set_stage(shader_sampler[i], shader_image[i]); i++
	texture_set_stage(shader_sampler[i], shader_image[i]); i++

	draw_sprite_ext(image_1,0,800,500,0.5,0.5,current_time/100,c_white,1)

shader_reset()
