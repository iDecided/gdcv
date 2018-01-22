var _sizeW = sprite_get_width(spr_overview_affection_temp) / 3;
var _sizeH = sprite_get_height(spr_overview_affection_temp);
var _subImg = argument0;
var _x1 = argument1;
var _x2 = argument2;
var _y = argument3;
var _w = _x2 - _x1;
var _columns = _w / _sizeW;

draw_sprite_part(spr_overview_affection_temp, _subImg, 0, 0, _sizeW, _sizeH, _x1, _y);
draw_sprite_part(spr_overview_affection_temp, _subImg, _sizeW * 2, 0, _sizeW, _sizeH, _x1 + (_columns * _sizeW), _y);