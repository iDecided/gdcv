/// @description Takes a datetime object and formats the time to work for the top menu GUI
var hour = date_get_hour(argument0);
var hourString = string(hour);
var amOrPm = "AM"
if(hour >= 12) {
	amOrPm = "PM";
	if(hour > 12) {
		hourString = string(hour-12);
	}
}

var minuteString = string(date_get_minute(argument0));
if(minuteString == "0") minuteString = "00";

var timeString = hourString + ":" + minuteString + " " + amOrPm;
return timeString;