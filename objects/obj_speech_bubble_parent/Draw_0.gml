/// @description Insert description here
// You can write your code in this editor
//Creating the surface
if (surface_exists(obj_talking_surface.surfacewithmask))
   {
	      surface_set_target(obj_talking_surface.surfacewithmask);
   }
   else
   {
	    obj_talking_surface.surfacewithmask = surface_create(1280,560);
	    surface_set_target(obj_talking_surface.surfacewithmask);
   }
   
//Message details
draw_self();
draw_set_font(fnt_talking);
draw_set_color(c_black);
draw_text(x + 69, y - 53, _message);


surface_reset_target();
draw_surface(obj_talking_surface.surfacewithmask,0,0);
surface_free(obj_talking_surface.surfacewithmask);
