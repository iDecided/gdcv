file = file_text_open_read("gift_summaries.json");
json = file_text_read_string(file);
jsonMap = json_decode(json);

if (jsonMap != -1) {
	show_message("JSON sucessfully decoded");
	biMap = ds_map_find_value(jsonMap, ds_map_find_first(jsonMap));
	size = ds_map_size(jsonMap);
	show_message("There are "+string(size)+" entires in the tree index");
}
else{
	show_message("Could not read gift_summaries.json") ; 
}

show_message(jsonMap[? "veronica"]);

file_text_close(file);