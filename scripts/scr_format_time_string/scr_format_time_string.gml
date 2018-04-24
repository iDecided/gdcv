/// @description Takes a datetime object and formats the time to work for the top menu GUI
/// @arg0 date the date that you want to get the hour string for
/// @arg1 incAMPM (Boolean) Whether or not you want to include the AM or PM modifier for the current time

var _date = argument0;
var includeAmOrPm = argument1;

var hour = date_get_hour(_date);
var hourString = string(hour);
var amOrPm = "A"
if(hour >= 12) {
	amOrPm = "P";
	if(hour > 12) {
		hourString = string(hour-12);
	}
}

var minuteString = string(date_get_minute(_date));
if(minuteString == "0") minuteString = "00";

var timeString = hourString + ":" + minuteString + " ";
if(includeAmOrPm) {
	timeString += amOrPm;
}
return timeString;

// 04/23/2018
// Quick note: I just found this site:
//		http://www.gmlscripts.com/script/Computation/Date-Time/
// and it turns out that they write a script that's WAY better than mine and way more functional.
// Maybe I should use this as an example of using other peoples' code? I'd have to go over how to
// credit the creator and whatnot.