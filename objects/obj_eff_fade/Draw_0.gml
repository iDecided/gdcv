/// @description Transitions the rooms with a fade effect
// You can write your code in this editor
if(whereToGo) {
	a = clamp(a + (fade * rate), 0, 1);
	if(a == 1) {
		room_goto(whereToGo);
		fade = -1;
	}

	if(a == 0 && fade == -1) {
		instance_destroy();
	}

	draw_set_color(c_black);
	draw_set_alpha(a);
	draw_rectangle(0,0,room_width,room_height,0);
}
