/// @description Adds gifts to the player's inventory automatically
/// @arg0 trinket (Enum) The type of trinket to add

var _trink = argument0;

if(global.trinkets[_trink] > 0) {
	global.trinkets[_trink]--;
}