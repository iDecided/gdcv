/// @description Insert description here
// You can write your code in this editor
draw_self();
var owner = string_copy(global.showNewGift, 0, string_length(global.showNewGift) - 2);
var level = string_char_at(global.showNewGift, string_length(global.showNewGift));

draw_sprite_ext(asset_get_index("spr_gift_" + owner), real(level), x-100, y-100, 0.2, 0.2, 0, c_white, 1);