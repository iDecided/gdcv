/// @description Insert description here
// You can write your code in this editor
with(owner) {
	selectedText = other.text;
	selectedValue = other.value;
	obj_submit.plannedDate[? listType] = other.value;
}

with(obj_dropdown_item) {
	instance_destroy();
}