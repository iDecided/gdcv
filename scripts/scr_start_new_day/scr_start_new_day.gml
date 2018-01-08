// Need to probably run a new script that shows it's a new day
global.date = date_inc_day(global.date, 1);
global.date = date_create_datetime(date_get_year(global.date), date_get_month(global.date), date_get_day(global.date), 8, 0, 0);
global.tod = time.morning;