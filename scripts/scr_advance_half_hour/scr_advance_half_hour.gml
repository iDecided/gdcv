if(date_get_hour(date_inc_minute(global.date, 30)) == 0) {
	scr_start_new_day();
}
else {
	global.date = date_inc_minute(global.date, 30);
	var hour = date_get_hour(global.date);
	if(hour >= 8 && hour < 12) global.tod = time.morning;
	else if(hour >= 12 && hour < 17) global.tod = time.afternoon;
	else if(hour >= 17 && hour <= 23) global.tod = time.night;
}
show_debug_message(date_datetime_string(global.date));

// 04/08/2018
// I actually don't think this should be here. It's the same problem as below where I think that I need to move
// it elsewhere in order to keep to separation of concerns standards as possible.
// (10 minutes later and with immense confusion on his face)
// Yeah, no. This definitely needs to be fixed. Because the code in the world population script should be broken up into
// frontend and backend like how I'm doing it with trinkets. Once I figure out what I'm going to do with the 
scr_populate_overworld();

// 04/08/2018
// So. I realized as I was coding trinket spawning that I was putting things that had NOTHING to do with actually
// advancing time in the time advance script. This is really bad because this breaks rules about separation of
// concerns. I should move this to the button instead, because then it's easier to read what happens when you press it.
//scr_spawn_trinkets_backend(room_get_name(room), false);

// This should actually probably move to the button click event for the time advance buttons
//with(obj_trinket_spawn) {
//	_type = irandom_range(trinket.tr_1, trinket.tr_6);
//}