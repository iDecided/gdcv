/// @arg aff  The numeral value of their affection
/// @arg char  Used to determine the color of the bar
/// @arg x1  Where the left end should draw
/// @arg w  Width of a single segment
/// @arg y  Where on the y axis the bar should draw (top left)

var _affection = argument0;
var _character = argument1;
var _x = argument2;
var _w = argument3;
var _y = argument4;

var _index = ds_list_find_index(global.names, _character);

#region The struggle.
// WHY THE ACTUAL FUCK IS THIS SO GODDAMN HARD LIKE FUCK THIS
// ~ Zachary, at GGJ, on why drawing the detail affection bar is so dumb.
/*var _numBars = floor(global.affectionMap[? global.detailedCharacter] / 20) + 1;
if(global.affectionMap[? global.detailedCharacter] % 20 == 0) {
	_numBars--;
}
	
show_debug_message("Drawing " + string(_numBars));
	
for (var i = 0; i < _numBars; ++i) {
	if(i * 20 <= global.affectionMap[? global.detailedCharacter]) {
		//show_debug_message("drawing full");
		//scr_draw_affection_bars(spr_detail_bar, 0, 265 + (i * 200), 454 + (i * 200), 155);
	}
	else {
		//show_debug_message("drawing percentage");
		//scr_draw_affection_bars(spr_detail_bar, 0, 265 + (i * 200), (265 + (i * 200)) + (454 * (global.affectionMap[? global.detailedCharacter] % 20) * 5 / 100), 155);
	} 
		
	scr_draw_affection_bars(spr_detail_bar, 0, 265 + (i * 200), (265 + (i * 200)) + (454 * (global.affectionMap[? global.detailedCharacter] % 20) * 5 / 100), 155);
		
	// scr_draw_affection_bars(spr_detail_bar, 0, 265 + (i * 200), ((454 * global.affectionMap[? global.detailedCharacter] - (global.affectionLevelMap[? global.detailedCharacter] * 20)) / 100), 155);
	//show_debug_message("Percentage needed: " + string((global.affectionMap[? global.detailedCharacter] % 20) * 5 / 100));
	//scr_draw_affection_bars(spr_detail_bar, 0, 265 + (i * 200), (265 + (i * 200)) + (454 * (global.affectionMap[? global.detailedCharacter] % 20) * 5 / 100), 155);
}*/
// FUCK IT, I CAN'T FIGURE THIS OUT, I'M WRITING A NEW DRAW SCRIPT THAT USES PERCENTAGES AND AN ENDPOINT
	
//scr_draw_affection_bars_percentage(spr_detail_bar, 0, 265, 433, 50, 155);
// Never mind...I'm just gunna work on the game jam stuff now...I'm sick of this. I'll figure it out later.
#endregion

// Oh my God...I finally fucking did it...I *finally* figured it out...goddammit...
// 20:43 at night...so many hours later...and I figured it out
// Here's something to think about in the future: it can really, REALLY help to make temp variables that are well named to help you figure out what you're doing.
var fullBars = floor(_affection / 20);
for (var i = 0; i < fullBars; ++i) {
	scr_draw_affection_bars(spr_detail_bar, _index, _x + (i * 200), _x + _w + (i * 200), _y);
}
// Find how much more we need to draw
var remainder = _affection % 20;
// Compute a number out of 100 that represents the percentage of the next bar that needs to be drawn
var percentage = remainder * 100 / 20;
//show_debug_message("remainder: " + string(remainder) + " percentage: " + string(percentage));
// Checks to see if we even need to draw anything.
if(remainder > 0) {
	// Draw the affection remainder bar
	var xOffset = _x + (fullBars * 200);
	scr_draw_affection_bars(spr_detail_bar, _index, xOffset , xOffset + _w * percentage / 100, _y);
}
//ds_map_destroy(charDetails);