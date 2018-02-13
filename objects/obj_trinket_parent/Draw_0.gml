/// @description Insert description here
// You can write your code in this editor

image_index = _type;
draw_self();

draw_set_font(fnt_trinkets);
draw_set_valign(fa_bottom);
draw_text(x + sprite_width - 5, y + sprite_height, "x" + string(global.trinkets[_type]));
draw_set_valign(fa_top);