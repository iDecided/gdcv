/// @description 
// You can write your code in this editor


draw_set_color(c_black);
draw_set_font(fnt_datetime);
var timeString = string(date_get_hour(global.date)) + ":" + string(date_get_minute(global.date));
draw_text(0, 0, weekdayNames[date_get_weekday(global.date)]);
draw_text(110, 0, timeString);