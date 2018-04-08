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