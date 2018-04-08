/// @arg room  Pass in the room name (as a string) to incerease the chances of spawning one in the room you're in
/// @arg todChange  Flag that marks if it's from FF or superFF

/*
There are three things that are taken into account when trinkets are spawned in the game
1. What room you are in
2. How many trinkets have been dropped in the world
3. Was it done during a fast forward or a super fast forward

As more trinkets spawn in the world, your chances of spawning a trinket anywhere is decreased.

The room is then used in two ways:
1. Any room you are in has a slightly higher chance of spawning an extra (temporary, might be too nice) item right there in the room
2. The room you are in also influences the type of trinket that is dropped if you receive an extra trinket drop, weighted to drop certain ones in certain rooms

Finally, if you have used the ToD super fast forward, you have a guaranteed 4x30% chance to drop a random item in any random room
*/

var _roomName = argument0;
var _todChangeFlag = argument1;

var _initialRoll = irandom_range(global.totalTrinketsSpawned, 100);
var _spotRoll = irandom_range(0, global.numTrinketSpawns - 1);
var _typeRoll = irandom_range(trinket.tr_1, trinket.tr_6);

ds_list_replace(trinketSpawns[? _roomName], _spotRoll, _typeRoll);

//show_debug_message("The current room's trinket list: " + ds_list_write(trinketSpawns[? _roomName]));

//if(!_todChangeFlag) {
//	var _randomItemType = irandom_range(trinket.tr_1, trinket.tr_6);
//	var _extraItemRoll = irandom_range(0, 100);

//	if(_initialRoll < 50) {
//		// add a random trinket to a random room of a random type
	
//		// check to see if we spawn an extra item in the room you're in
//		if(_extraItemRoll <= 10) {
//			//trinketSpawns[, ]
//			//ds_map_add()
//		}
//	}
//}
//else {
	
//}