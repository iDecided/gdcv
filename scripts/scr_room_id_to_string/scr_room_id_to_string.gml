/// @arg0 roomID (String) The id of the room, given as a string
/// @arg1 abbrv (Boolean) Whether or not you want the abbriviated version of the room name

var roomIDString = argument0;
var abbrev = argument1;
// This makes the default response 'Off Campus' for both bad input and just blank strings
var locString = "Off Campus";

if(!abbrev) {
	switch (roomIDString) {
		case "rm_cc":
			locString = "Central Campus";
			break;
		case "rm_cs":
			locString = "Convenience Store";
			break;
		case "rm_dc":
			locString = "Dining Center";
			break;
		case "rm_gdl":
			locString = "Game Dev Lab";
			break;
		case "rm_lib":
			locString = "Library";
			break;
		case "rm_ps":
			locString = "Pearson Hallway";
			break;
		case "rm_sr":
			locString = "Streaming Room";
			break;
		case "rm_ud":
			locString = "Union Drive";
			break;
		default:
			break;
	}
}
else {
	switch (roomIDString) {
		case "rm_cc":
			locString = "Campus";
			break;
		case "rm_cs":
			locString = "C-Store";
			break;
		case "rm_dc":
			locString = "Dining";
			break;
		case "rm_gdl":
			locString = "GDL";
			break;
		case "rm_lib":
			locString = "Library";
			break;
		case "rm_ps":
			locString = "Pearson";
			break;
		case "rm_sr":
			locString = "S-Room";
			break;
		case "rm_ud":
			locString = "UDCC";
			break;
		default:
			break;
	}	
}

return locString;