/// @description Insert description here
// You can write your code in this editor

// Deleted draw and moved everything to draw GUI because I drawing the black background is on drawGUI
// So you have to this on Draw GUI or else the black background draws over top the dropdown as well

sprite_index = asset_get_index("spr_dropdown_" + listType);

draw_self();
draw_set_color(c_black);
draw_set_font(fnt_dropdown);
draw_set_valign(fa_middle);
if(selectedText == ""){
	draw_set_color($c7c7c7);
	draw_text(x + 10, y + sprite_height / 2, string(defaultOption));
}
else {
	draw_text(x + 10, y + sprite_height / 2, string(selectedText));
}
draw_set_valign(fa_top);