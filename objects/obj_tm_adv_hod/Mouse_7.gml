/// @description Insert description here
// You can write your code in this editor
var hour = date_get_hour(global.date);
var minute = date_get_minute(global.date);
global.date = date_inc_minute(global.date, 30);
if(hour == 23 && minute >= 30) {
	// Need to probably run a new script that shows it's a new day
	global.date = date_create_datetime(date_get_year(global.date), date_get_month(global.date), date_get_day(global.date), 8, 0, 0);
}
show_debug_message(date_datetime_string(global.date));