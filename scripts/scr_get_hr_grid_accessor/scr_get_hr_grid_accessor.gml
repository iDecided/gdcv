/// @arg0 time The time you want to find the accessor for for schedules

var timeToConvert = argument0;

var accessor = (date_get_hour(timeToConvert) - 8) * 2;
if(date_get_minute(timeToConvert) > 0) ++accessor;
return accessor;