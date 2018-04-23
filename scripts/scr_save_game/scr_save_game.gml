if(file_exists("diary.sav")){
	file_delete("diary.sav");
}
var saveFile = file_text_open_write("diary.sav");
file_text_write_real(saveFile, global.currentRoom);
file_text_close(saveFile);

show_debug_message("Should have saved.");