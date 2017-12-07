/// @description Insert description here
// You can write your code in this editor
// Draws the summary and zoomed in view of the other object.

//show_debug_message(sprite_get_name(sprite_index));
//show_debug_message(image_index);
drawSummary = true;

if(file_exists("gift_summaries.json"))
{
	var summFile = file_text_open_read("gift_summaries.json");
	file_text_close(summFile);
}
else
{
	show_debug_message("Yeah, so the gift summaries file doesn't seem to exist.");
}