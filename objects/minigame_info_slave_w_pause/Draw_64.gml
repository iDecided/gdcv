if(paused) {
	if(surface_exists(paused_surf)) {
		draw_surface(paused_surf, 0, 0);
	}
	else {
		show_message("Fudge");
	}
	draw_text_color(room_width/2, room_height/2, "Oh Shit boi we paused now",
	c_lime, c_lime, c_lime, c_lime, 1);
}