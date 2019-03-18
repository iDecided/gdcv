/// @description Insert description here
// You can write your code in this editor
if (surface_exists(obj_talking_surface.surfacewithmask))
   {
	      surface_set_target(obj_talking_surface.surfacewithmask);
   }
   else
   {
	   obj_talking_surface.surfacewithmask = surface_create(1280,720);
	    surface_set_target(obj_talking_surface.surfacewithmask);
	   // surface_create(670,435);
   }

//Current issue: populating the messages with spacing in between

//if((_amountScrolled > totalMessageHeight - (sprite_get_height(asset_get_index("spr_give_gift") + messagePadding))))
if(_position > 553)
{
	gpu_set_colorwriteenable(true, true, true, false);

}

draw_self();
draw_set_font(fnt_talking);
draw_set_color(c_black);
draw_text(x + 69, y - 53, _message);
 surface_reset_target();

//gpu_set_colorwriteenable(true, true, true, true);