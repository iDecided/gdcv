/// @description Insert description here
// You can write your code in this editor

items = array_create(5);

#region
for(var i = 0; i < 5; ++i)
{
	items[i] = instance_create_depth(i*255,110,0,obj_item_veronica);
	with(items[i]) {
	    image_speed = 0;
		image_index = i;
		image_xscale = 0.256;
		image_yscale = 0.256;
	}
}  
#endregion