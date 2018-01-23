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

populate_overworld();