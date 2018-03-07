/// @description Insert description here
// You can write your code in this editor
draw_self();

if(_choosingTr) {
	draw_sprite(spr_trinket_selector, 0, x + sprite_width / 2, y);
	
	if(!_trinketsDrawn) {
		var startX = 486;
		var startY = 367;
		var spacingX = 94;
		var spacingY = 89;
	
		var col = 0;
		var row = 0;
		for (var i = 0; i < global.numTrinketTypes; ++i) {
			var tempX = startX + (col * spacingX);
			var tempY = (row * spacingY) + startY;
			var tempObj = instance_create_depth(tempX, tempY, -1, obj_trinket_parent);
			with(tempObj)
			{
				_type = i;
				_interactive = true;
			}
			ds_list_add(_trinketObjs, tempObj);
			
			++col;
			if(col > 2)
			{
				++row;
				col = 0;
			}
		}
		_trinketsDrawn = true;
	}
}