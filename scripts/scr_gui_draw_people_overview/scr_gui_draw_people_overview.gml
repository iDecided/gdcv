// Draws the headshot instances on the people overview screen
#region
for(var i = 0; i < ds_list_size(global.names); ++i)
{
		var tempObj = instance_create_depth(494 + (374 * (i % 2)), 162 + (173 * floor(i / 2)), 0, obj_headshot);
		with(tempObj)
		{
			character = global.names[| i];
			image_speed = 0;
			image_index = i + 1;
			image_xscale = 0.13;
			image_yscale = 0.13;
			index = i;
		}
		ds_list_add(argument0, tempObj);
}
#endregion