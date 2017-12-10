/// @description Insert description here
// You can write your code in this editor
draw_self();

if(drawSummary)
{
	draw_sprite_ext(sprite_index,image_index,704,64,0.5,0.5,0,c_white,1);
	draw_text(704, 800, description);
}