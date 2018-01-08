/// @description Insert description here
// You can write your code in this editor

var hour = date_get_hour(global.date);
if(hour < 12) {
	global.date = date_create_datetime(date_get_year(global.date), date_get_month(global.date), date_get_day(global.date), 12, 0, 0);
}
else if(hour >= 12 && hour < 17) {
	global.date = date_create_datetime(date_get_year(global.date), date_get_month(global.date), date_get_day(global.date), 17, 0, 0);
}
else if(hour >= 17 && hour <= 23.50) {
	// Need to probably run a new script that shows it's a new day
	global.date = date_inc_day(global.date, 1);
	global.date = date_create_datetime(date_get_year(global.date), date_get_month(global.date), date_get_day(global.date), 8, 0, 0);
}
else {
	show_error("global.date was not in an acceptable time range. Check obj_tm_adv_tod. Time: " + date_time_string(global.date), true);
}

show_debug_message(date_datetime_string(global.date));