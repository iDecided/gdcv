/// @description Insert description here
// You can write your code in this editor

// Fun fact: this made me realize that there's a race condition in my rm_startmenu
// Right now, the buttons are created before the controllers are and so it's trying to access a globalvar
// that hasn't been created yet. Simple fix, all I have to do is change the order in the panel on the left.

// Just kidding. Just swapping them around in the Instances Layer Properties window didn't work

// Ryan got back to me about this. You go Room -> Instance Creation Order -> (it's now in a sidebar)
// If you're going to snag a clip of this, look at 03/15/18 in Discord.
if(hasSaveData) {
	event_inherited();
}