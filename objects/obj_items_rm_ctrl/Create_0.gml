/// @description Insert description here
// You can write your code in this editor

items = array_create(5);

var sizeRatio = 0.128;
var topMenuOffset = 100;

#region
for(var i = 0; i < 5; ++i)
{
	items[i] = instance_create_depth(i * 1000 * sizeRatio, (i * 1000 * sizeRatio) + topMenuOffset, 0, obj_item_veronica);
	with(items[i]) {
	    image_speed = 0;
		image_index = i;
		image_xscale = sizeRatio;
		image_yscale = sizeRatio;
	}
}  
#endregion