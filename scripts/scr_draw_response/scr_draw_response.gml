/// @arg sender  Determines what color background the response should have. Expects a value from the sender enum
/// @arg message  The message to display on the response
/// @arg bgSize  The size of the background thumbnail

//1152 is the top of the screen where the message spawns. 434 is the x value.
//1280*720 screen size. Height of 720
var _senderX = argument0;
var _messageX = argument1;
var _messageSizeX = argument2;

var _padding = 10;
var _id = 0;
var list = ds_list_create();
var _lastMessage;
var _firstMessage;

//Acts as a foreach loop
with(obj_speech_bubble_parent) {
    //Large things go by increments of 141
	//Medium go by increments of 114
	//Small go by increments of 80


	y -= _amountScrolled;
	_amountScrolled = 0;
	y -= sprite_get_height(asset_get_index("spr_convo_" + _messageSizeX)) + _padding;
	//Get the position of the first message and the last message aka the y position
   for (var i = 0; i < _id; i++;)
    {
	   ds_list_set(list, i, y);
    }
	_firstMessage = ds_list_find_value(list, 0);
	_lastMessage = ds_list_find_value(list,_id-1);

	_id++;
	
} 

//Gets the width of the message
var _tempX = 434; //npc temp
if(_senderX == sender.pc) {
	_tempX = 1152 - sprite_get_width(asset_get_index("spr_convo_" + _messageSizeX));
}

//Creates object at height 553
with(instance_create_depth(_tempX, 553, 0, obj_speech_bubble_parent)) 
{
	_sender = _senderX;
	_messageSize = _messageSizeX;
	_message = _messageX;
//	show_debug_message("Created a new message");
//	show_debug_message("Our position of NEW message:" + " " + string(y) + " And id:" + string(instance_id[_id]));
	ds_list_add(_id, 553);
 /* for (var i = 0; i < _id; i++;)
  {
 	  show_debug_message("Our position of this message:" + " " + string(instance_id[i].y) + " And id:" + string(instance_id[i]));
  }*/

}
