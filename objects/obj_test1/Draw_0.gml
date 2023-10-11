draw_set_colour(c_green)
draw_set_alpha(1)



shader_set(shad_image_in)
	
	var i = 0;
	shader_set_uniform_f_array(shader_params[i],shader_image_uvs[i]); i++
	shader_set_uniform_f_array(shader_params[i],shader_image_uvs[i]); i++
	shader_set_uniform_f(shader_params[i],mouse_x/100); i++
	shader_set_uniform_f(shader_params[i],mouse_y/100); i++
	//shader_set_uniform_f(shader_params[i++],(current_time / 12000) mod 0.93)

	var i = 0;
	texture_set_stage(shader_sampler[i], shader_image[i]); i++
	texture_set_stage(shader_sampler[i], shader_image[i]); i++

	draw_sprite_ext(image_1,0,200,200,2,2,current_time/100,c_white,1)
	draw_sprite_ext(image_1,0,500,500,4,4,current_time/100,c_white,1)
	draw_sprite_ext(image_1,0,150,500,1+sin(current_time/500)*0.3,1+sin(current_time/700)*0.3,current_time/500,c_white,1)

shader_reset()
