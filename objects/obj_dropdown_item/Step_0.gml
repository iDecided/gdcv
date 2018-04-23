/// @description Insert description here
// You can write your code in this editor

// 04/14/2018
// So I realized I was having an issue, because the parent of the dropdown item (the highlighter)
// set the image_index to either 0 or 1. This is why you don't hardcode things, kids!
//event_inherited();

// To fix it, I just copy-pasted the code and changed it to what I needed it to be.
if (position_meeting(mouse_x, mouse_y, self)) {
	image_index = (_typeImageIndex * 2) + 1;
}
else {
	image_index = _typeImageIndex * 2;	
}