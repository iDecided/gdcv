/// @description Insert description here
// You can write your code in this editor

var hour = date_get_hour(global.date);
if(global.tod == time.morning) {
	global.date = date_create_datetime(date_get_year(global.date), date_get_month(global.date), date_get_day(global.date), 12, 0, 0);
	global.tod = time.afternoon;
}
else if(global.tod == time.afternoon) {
	global.date = date_create_datetime(date_get_year(global.date), date_get_month(global.date), date_get_day(global.date), 17, 0, 0);
	global.tod = time.night;
}
else if(global.tod == time.night) {
	scr_start_new_day();
}
else {
	show_error("global.date was not in an acceptable time range. Check obj_tm_adv_tod. Time: " + date_time_string(global.date), true);
}

show_debug_message(date_datetime_string(global.date));

populate_overworld();