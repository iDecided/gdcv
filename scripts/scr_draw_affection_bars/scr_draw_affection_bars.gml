/// @arg spr  The sprite to draw
/// @arg subImg  The sub image to draw
/// @arg x1  Where the left end should draw
/// @arg x2  Where the right end should draw
/// @arg y  Where on the y axis the bar should draw (top left)

var _sprite = argument0;
var _subImg = argument1;
var _x1 = argument2;
var _x2 = argument3;
var _y = argument4;

var _sizeW = sprite_get_width(_sprite) / 3;
var _sizeH = sprite_get_height(_sprite);
var _w = _x2 - _x1;
var _columns = _w / _sizeW;

// Draw the ends
draw_sprite_part(_sprite, _subImg, 0, 0, _sizeW, _sizeH, _x1, _y);
draw_sprite_part(_sprite, _subImg, _sizeW * 2, 0, _sizeW, _sizeH, _x1 + (_columns * _sizeW), _y);

// Draw the bar inbetween the ends
for (var i = 1; i < _columns; ++i) {
    draw_sprite_part_ext(_sprite, _subImg, _sizeW, 0, 1, _sizeH, _x1 + _sizeW, _y, _w - (_sizeW ), 1, c_white, 1);
}