// View notes in scr_save_game to see why these changes were made

//if(file_exists("diary.sav")) {
//	var loadFile = file_text_open_read("diary.sav");
//	var loadedRoom = file_text_read_real(loadFile);
//	file_text_close(loadFile);
//	room_goto(loadedRoom);
//}
//show_debug_message("Should have loaded.");

if(file_exists("diary.ini")) {
	var loadFile = ini_open("diary.ini");
	
	
	// ~~ Game State (sd_gamestate)
	// Loading the datetime and current ToD
	// Loading the list of planned dates
	// Loading the room the player is currently in.
	var loadedRoom = ini_read_real("sd_gamestate", "currentRoom", -1);
	if(loadedRoom == -1) { // I used -1 as the default here, so if you're somehow loading into a room that wasn't saved correctly you'll get an error crash.
		show_message("An invalid room number was read from the save file. Please view scr_load_game to understand why this may have happened.");
		game_end();
		exit;
	}
	// Loading the list of names (to keep track of if they've met the secret characters)
	ds_list_read(global.names, ini_read_string("sd_gamestate", "nameList", ""));


	// ~~ World State (sd_worldstate)
	// Loading the trinket locations
	var trinketsJSON = ini_read_string("sd_worldstate", "trinketLocations", "");
	show_debug_message("TrinketsJSON: " + trinketsJSON + "(end)");
	//ds_map_read(global.trinketSpawns, json_decode(ini_read_string("sd_worldstate", "trinketLocations", "")));
	// ~~ Player State (sd_playerstate)
	// Loading the player's inventory TODO
	// Loading the affectionMap
	// Loading the affection levels
	// Loading the known schedule TODO
	
	ini_close();
	room_goto(loadedRoom);
}
else {
	show_message("There was no file to load!");
	game_end();
	exit;
}

// 04/23/2018
// I wrote a temp script that just writes to a different INI file so I can make sure everything
// copied over correctly.
scr_write_current_state();
show_debug_message("Should have loaded.");