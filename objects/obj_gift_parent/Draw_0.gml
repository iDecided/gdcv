/// @description Insert description here
// You can write your code in this editor
draw_self();

if(isSelected) {
	draw_sprite(spr_gift_highlighter,0,x-12,y-15);
	
	draw_sprite_ext(asset_get_index("spr_gift_"+giftRecip),giftLevel,855,142,0.3,0.3,0,c_white,1);
	draw_set_color(c_white);
	draw_set_font(fnt_gifts);
	draw_text_ext(850, 498, giftDesc, font_get_size(fnt_gifts)+10, 350);
}