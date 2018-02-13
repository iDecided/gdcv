/// @arg0 fileName (String) The string name of the json you want to read in. INCLUDING THE EXTENSION.

var _fileName = argument0;

file = file_text_open_read(_fileName);

// Reading in the JSON
var jsonString = "";
while (!file_text_eof(file))
{
   jsonString += file_text_readln(file);
}
file_text_close(file);

jsonMap = json_decode(jsonString);

if (jsonMap != -1) {
	size = ds_map_size(jsonMap);
	show_debug_message("JSON sucessfully decoded. There are " + string(size) + " entires in the tree index");
}
else{
	show_message("Could not read " + string(_fileName)); 
}

return jsonMap;