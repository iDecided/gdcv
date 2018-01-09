/// @description Insert description here
// You can write your code in this editor

a = clamp(a + (fade * rate), 0, 1);
if(a == 1) {
	// go to the next room
	room_goto(roomToGoTo);
	fade = -1;
}

if(a == 0 && fade == -1) {
	instance_destroy();
}

draw_set_color(c_black);
draw_set_alpha(a);
draw_rectangle(view_xport[0], view_yport[0], view_xport[0] + view_wport[0], view_yport[0] + view_hport[0], 0);