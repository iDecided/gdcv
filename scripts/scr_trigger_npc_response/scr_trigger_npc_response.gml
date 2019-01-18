/// @arg trigger  This is the source of the trigger. Expects one of the respTriggers enum values
/// @arg supp1  Supplemental data needed to discern various aspects of the response
/// @arg supp2  Supplemental data needed to discern various aspects of the response

var _trigger = argument0;
var _supp1 = argument1;
var _supp2 = argument2;

/*
04/08/2018 4:39A

NPC responses are organized based on three criteria:
1. The trigger that sent it
2. Their tone of response
3. The strength of their response

These are determined by calling this script and supplying what the trigger is and any supplemental data necessary
to discern the other two aspects of a response.

// 04/08/2018
// This was moved to a new script dedicated to creating and spawning the messages
Once the response is determined, these are the next steps to showing the response
1. Figure out the required size of the response based on the length of the string found from the above process
2. Shift all response objects up by the height of the size of the response
3. Spawn a new response instance
4. Set the new instance's instance variables

*/

if(_trigger == respTriggers.trinket) {
	scr_draw_response(sender.npc, "Test message from NPC", "small");
	scr_draw_response(sender.pc, "Test message from PC", "small");
}