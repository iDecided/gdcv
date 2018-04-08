/// @description Insert description here
// You can write your code in this editor

if(visible) {
	scr_add_trinket(_type);
}
_type = -1;
visible = false;

// 04/08/2018
// Made and ass out of myself at the game jam with one hell of a premature celebration. Btw, this game jam was the partner jam for the Pip-Boys
// I have everything working for trinkets except updating the backend DS whenever you collect that trinket off the ground.
// Upon further thought, this is actually far more tricky than I initially thought.
// You see, I was using instance_find within the frontend code to update the spawners with the type that needs to be shown
// based off the backed. But it's not possible to get an instance's instance number within the object, so I have no way to point
// back to the backend to tell it that it's been picked up.

// 04/08/2018 3:31P UPDATE
// Holy fuck, I made this way more complicated than it needed to be. Like waaaaaaaay more complicated.
// Ryan helped (again, he's gunna get a huge shoutout in the credits) so check the DMs.
// But the idea is that when I update the trinketSpawner's type I also just have it store the index that was used in the list.
// And that acts exactly like using the number that instance_find uses to, well, find the instance.
// Ryan's a godsend.
var _tempList = trinketSpawns[? room_get_name(room)];
_tempList[| _instanceListNum] = -1;


// As I researched this, it also enlightened me to another issue with Game Maker's object-faking. Static variables just
// don't exist in GML. It's not possible, because they aren't truly objects. You could probably fake static variables too, or maybe
// there's something else that works as a stand-in for them, but I'm not sure. Interesting thought, though.