/// @description Insert description here
// You can write your code in this editor
draw_self();

if(drawSummary)
{
	draw_sprite_ext(sprite_index,image_index,704,64,0.5,0.5,0,c_white,1);
}

// Load the 
if(file_exists("item_summaries.json"))
{
	var summFile = file_text_open_read("item_summaries.json");
	file_text_close(summFile);
}
else
{
	show_debug_message("Yeah...the item summaries json don't exist.");
}