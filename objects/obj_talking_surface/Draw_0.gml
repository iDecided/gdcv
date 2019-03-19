/// @description Insert description here
// You can write your code in this editor

if (surface_exists(surfacewithmask)) 
{
	
	draw_surface(surfacewithmask,0,0);
}
else
{
	
	surfacewithmask = surface_create(1280,720);
}
//draw_surface(surfacewithmask,200,65);
//surfacewithmask = surface_create(670,435);
//For finding positions
/*draw_text(200,65,"left");
draw_text(930,50,"right");
draw_text(200,485,"downl");
draw_text(933,485,"downr");*/

