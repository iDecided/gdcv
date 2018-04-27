// 04/22/2018
// So I initially wrote this and load_game with the idea in mind to just write stuff to a file and call it good
// but actually, there's a much easier way to do this and that's with .ini files, so I'm going to switch to that.
// Second thing: I had to do some digging to figure out exactly where these files get written to. You have to go to
// %LocalAppData% and look for the name of your project in one of those folders. Then, the files you create in code
// show up there.

//if(file_exists("diary.sav")){
//	file_delete("diary.sav");
//}
//var saveFile = file_text_open_write("diary.sav");
//file_text_write_real(saveFile, global.currentRoom);
//file_text_close(saveFile);
//show_debug_message("Should have saved.");

if(file_exists("diary.ini")) {
	file_delete("diary.ini");
}
var saveFile = ini_open("diary.ini");


// ~~ Game State (sd_gamestate)
// Saving the datetime and current ToD
ini_write_real("sd_gamestate", "datetime", global.date);
ini_write_real("sd_gamestate", "tod", global.tod);
// Saving the list of planned dates
var plannedDatesString = json_encode(global.plannedDates);
ini_write_string("sd_gamestate", "plannedDates", plannedDatesString);
// Saving the room the player is currently in.
ini_write_real("sd_gamestate", "currentRoom", global.currentRoom);
// Saving the list of names (to keep track of if they've met the secret characters)
ini_write_string("sd_gamestate", "nameList", ds_list_write(global.names));


// ~~ World State (sd_worldstate)
// Saving the trinket locations
var trinketString = json_encode(global.trinketSpawns);
// Have to change the double quotes to single quotes, because just look at my Reddit post on 04/24/2018
// Sidenote: this means I can't use single-quotes in this list anymore
ini_write_string("sd_worldstate", "trinketLocations", string_replace_all(trinketString, "\"", "'"));

// ~~ Player State (sd_playerstate)
// Saving the player's inventory
var giftList = ds_list_create();
for (var i = 0; i < global.maxGifts; ++i) {
    giftList[| i] = global.gifts[i];
}
ini_write_string("sd_playerstate", "giftList", ds_list_write(giftList));
// Saving the affectionMap
var affectionMapString = json_encode(global.affectionMap);
ini_write_string("sd_playerstate", "affectionMap", string_replace_all(affectionMapString, "\"", "'"));
// Saving the affection levels
var affectionLevelsString = json_encode(global.affectionLevelMap);
ini_write_string("sd_playerstate", "affectionLevelsMap", string_replace_all(affectionLevelsString, "\"", "'"));
// Saving the known schedule TODO

// Note on this function: the file is not written to disk until you close the ini file. It's just kept in memory
// and disappears once the game exits if you never close the file.
ini_close();

show_debug_message("Should have saved.");