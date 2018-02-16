/// @description Insert description here
// You can write your code in this editor

if(!_isNPCResponse) {
	sprite_index = asset_get_index("spr_pc_response_" + _messageSize);
}
draw_self();
draw_set_font(fnt_talking);
draw_set_color(c_black);
draw_text(x + 73, y + 17, _message);