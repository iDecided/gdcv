/// @description Insert description here
// You can write your code in this editor


//This is all for health bar
var healthBarLength = 200;
var healthBarHeight = 30;
var healthBarStartX = 32;
var healthBarStartY = 24;

//Draw red bar
draw_rectangle_color(healthBarStartX, healthBarStartY,
					 healthBarStartX + healthBarLength,
					 healthBarStartY + healthBarHeight,
					 c_red, c_red, c_red, c_red, false )
					 
//Draw outline black bar
draw_rectangle_color(healthBarStartX, healthBarStartY,
					 healthBarStartX + healthBarLength,
					 healthBarStartY + healthBarHeight,
					 c_black, c_black, c_black, c_black, true )
					
var percentBarFilled = my_health / max_health;
var healthBarFilled = percentBarFilled * healthBarLength;

//Draw green bar
draw_rectangle_color(healthBarStartX, healthBarStartY,
					 healthBarStartX + healthBarFilled,
					 healthBarStartY + healthBarHeight,
					 c_green, c_green, c_green, c_green, false )
					 
					 
//This is for reload bar
var ShotBarLength = 40;
var ShotBarHeight = 3;
var ShotBarStartX = x - 20;
var ShotBarStartY = y - 50;

//Draw red bar
draw_rectangle_color(ShotBarStartX, ShotBarStartY,
					 ShotBarStartX + ShotBarLength,
					 ShotBarStartY + ShotBarHeight,
					 c_red, c_red, c_red, c_red, false )
					 
//Draw outline black bar
draw_rectangle_color(ShotBarStartX, ShotBarStartY,
					 ShotBarStartX + ShotBarLength,
					 ShotBarStartY + ShotBarHeight,
					 c_black, c_black, c_black, c_black, true )
					
var percentShotBarFilled = timer / shotRate;
percentShotBarFilled = clamp(percentShotBarFilled, 0, 1);
var ShotBarFilled = percentShotBarFilled * ShotBarLength;

//Draw green bar
draw_rectangle_color(ShotBarStartX, ShotBarStartY,
					 ShotBarStartX + ShotBarFilled,
					 ShotBarStartY + ShotBarHeight,
					 c_green, c_green, c_green, c_green, false ) 
					 
					 
					 