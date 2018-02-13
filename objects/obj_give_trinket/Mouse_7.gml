/// @description Prompt the user for which gift they'd like to give the person
// You can write your code in this editor

_choosingTr = !_choosingTr;
if(!_choosingTr) {
	for (var i = 0; i < ds_list_size(_trinketObjs); ++i) {
		instance_destroy(_trinketObjs[| i], true);
	}
	ds_list_clear(_trinketObjs);
}
_trinketsDrawn = false;