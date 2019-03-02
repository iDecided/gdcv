/// @description Insert description here
// You can write your code in this editor



/*	if place_meeting(x, y, obj_goodbye)
	{
		y += 25;
		show_debug_message("foo");
	}
*/

_amountScrolled += 25;

//Can't scroll past 553
if(y < _lastMessage)
{
		y += 25;
}
else
{
	
}