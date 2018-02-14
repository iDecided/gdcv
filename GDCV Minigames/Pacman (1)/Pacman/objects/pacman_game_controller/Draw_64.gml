/// @description Insert description here
// You can write your code in this editor

//This is all for health bar
var healthBarLength = 200;
var healthBarHeight = 30;
var healthBarStartX = 600;
var healthBarStartY = 24;

//Draw white background bar
draw_rectangle_color(healthBarStartX, healthBarStartY,
					 healthBarStartX + healthBarLength,
					 healthBarStartY + healthBarHeight,
					 c_white, c_white, c_white, c_white, false )
					 
//Draw outline black bar
draw_rectangle_color(healthBarStartX, healthBarStartY,
					 healthBarStartX + healthBarLength,
					 healthBarStartY + healthBarHeight,
					 c_black, c_black, c_black, c_black, true )
					
var percentBarFilled = current_dots / goal_dots;
var healthBarFilled = percentBarFilled * healthBarLength;

//Draw progress filled
draw_rectangle_color(healthBarStartX, healthBarStartY,
					 healthBarStartX + healthBarFilled,
					 healthBarStartY + healthBarHeight,
					 c_yellow, c_yellow, c_yellow, c_yellow, false )
