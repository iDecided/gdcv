if(paused) {
	if(surface_exists(paused_surf)) {
		draw_surface(paused_surf, 0, 0);
	}
	else {
		show_message("Fudge");
	}
	//draw_text_color(room_width/2, room_height/2, "PAUSED", c_lime, c_lime, c_lime, c_lime, 1);
	draw_text_ext_transformed_color(room_width/2, room_height/2, "PAUSED", 0, 1080, 10, 10, 0, c_lime, c_lime, c_lime, c_lime, 1);
}