/// @description Insert description here
// You can write your code in this editor

if (surface_exists(surfacewithmask)) 
{
	
	draw_surface(surfacewithmask,0,0);
}
else
{
	
	surfacewithmask = surface_create(1280,560);
}


