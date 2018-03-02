/// @description Insert description here
// You can write your code in this editor


if(keyboard_check(ord("1"))) {
	difficulty_level = 1;
}

if(keyboard_check(ord("2"))) {
	difficulty_level = 2;
}

if(keyboard_check(ord("3"))) {
	difficulty_level = 3;
}

if(keyboard_check(ord("4"))) {
	difficulty_level = 4;
}

if(keyboard_check(ord("5"))) {
	difficulty_level = 5;
}

if(keyboard_check_pressed(ord("P"))) {
	paused = !paused;
	if(paused) {
		surface_copy(paused_surf, 0, 0, application_surface);
		instance_deactivate_all(true);
		application_surface_draw_enable(false);
	}
	else {
		instance_activate_all();
		application_surface_draw_enable(true);
	}
}