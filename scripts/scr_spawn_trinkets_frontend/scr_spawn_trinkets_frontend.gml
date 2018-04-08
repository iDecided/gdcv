/// @description This script is called within any room in order to take the trinkets stored in the backed data structure and update the spawners in the room to be the type they need to be

var _tempList = trinketSpawns[? room_get_name(room)];
//var _tempStr = "Trinkets needing to be drawn in this room: ";
for (var i = 0; i < global.numTrinketSpawns; ++i) {
	with(instance_find(obj_trinket_spawn, i)) {
		_type = _tempList[| i];
		_instanceListNum = i;
		//_tempStr += string(_type) + "& ";
	}
}
//show_debug_message(_tempStr);