/// @arg sender  Determines what color background the response should have. Expects a value from the sender enum
/// @arg message  The message to display on the response
/// @arg bgSize  The size of the background thumbnail

var _senderX = argument0;
var _messageX = argument1;

// TODO: This needs to be determined based on the length of the message
var _messageSizeX = argument2;

// This with statement resets the positions of all of the messages that have been spawned so that
// the newest message appears at the bottom of the queue
with(obj_speech_bubble_parent) {
	y -= _amountScrolled;
	_amountScrolled = 0;
	y -= sprite_get_height(asset_get_index("spr_convo_" + _messageSizeX)) + messagePadding;
}

var _tempX = 434;
if(_senderX == sender.pc) {
	_tempX = 1152 - sprite_get_width(asset_get_index("spr_convo_" + _messageSizeX));
}

with(instance_create_depth(_tempX, 553, 0, obj_speech_bubble_parent)) {
	_sender = _senderX;
	_messageSize = _messageSizeX;
	_message = _messageX;
	
	totalMessageHeight += sprite_get_height(asset_get_index("spr_convo_" + _messageSizeX)) + messagePadding;
	show_debug_message("Total Message Height: " + string(totalMessageHeight));
}