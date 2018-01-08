var accessor = (date_get_hour(global.date) - 8) * 2;
if(date_get_minute(global.date) > 0) ++accessor;
return accessor;