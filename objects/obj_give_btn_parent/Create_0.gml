// 03/07/2018
// It's been a long time since I actually sat down and worked on this, but I'm doing it now so woo!
// Alright, so I've decided that since obj_give_trinket and obj_give_gift are so simple, I'm actually goin
// to move all of their functionality into a parent object. 
// There are two goals for this: 1) to make is easier to understand and teach and 2) to fix the "you can
// have both gifts and trinkets open at the same time" bug
// I'm starting by copying almost everything over from the gifts button

/// @description Insert description here
// You can write your code in this editor

_childrenType = pointer_null;
_choosing = false;
_childrenDrawn = false;
_popupSprite = pointer_null;
_childrenObjs = ds_list_create();

// 04/14/2018
// Created this flag in order to change the button into a disabled state, but really that was just modifying already
// existing code that I had so you couldn't give items when they were waiting for a date.
// Also, I made this comment *after* committing.
_disabled = false;
if(global.plannedDates[? global.talkingTo]) {
	_disabled = true;
	image_index = 2;
}