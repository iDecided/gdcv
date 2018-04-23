if(file_exists("diary.sav")) {
	var loadFile = file_text_open_read("diary.sav");
	var loadedRoom = file_text_read_real(loadFile);
	file_text_close(loadFile);
	room_goto(loadedRoom);
}

show_debug_message("Should have loaded.");