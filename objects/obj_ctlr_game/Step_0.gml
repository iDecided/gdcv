/// @description Debug Code
// You can write your code in this editor
if(isTalking == true)
{
	if(keyboard_check_released(ord("1")))
	{
		scr_draw_response(sender.npc, "Small message from NPC");
	}
	if(keyboard_check_released(ord("2")))
	{
		scr_draw_response(sender.pc, "Small message from PC");
	}
	if(keyboard_check_released(ord("3")))
	{
		scr_draw_response(sender.npc, "Med message from NPC");
	}
	if(keyboard_check_released(ord("4")))
	{
		scr_draw_response(sender.pc, "Med message from PC");
	}
	if(keyboard_check_released(ord("5")))
	{
		scr_draw_response(sender.npc, "Large message from NPC");
	}
	if(keyboard_check_released(ord("6")))
	{
		scr_draw_response(sender.pc, "Large message from PC");
	}
	if(keyboard_check_released(ord("7")))
	{
		scr_draw_response(sender.pc, "Large message from PC");
		responseReaction = respStrengths.soft;
	}
	if(keyboard_check_released(ord("8")))
	{
		scr_draw_response(sender.pc, "Large message from PC");
		responseReaction = respStrengths.medium;
	}
	if(keyboard_check_released(ord("9")))
	{
		scr_draw_response(sender.pc, "Large message from PC");
		responseReaction = respStrengths.strong;
	}
	if(keyboard_check_released(ord("S")))
	{
		scr_save_game();
	}
	if(keyboard_check_released(ord("L")))
	{
		scr_load_game();
	}
	if(keyboard_check_released(ord("G")))
	{
		var nameString = global.names[| irandom_range(people.jacob, people.mario)];
		while(nameString == undefined) {
			nameString = global.names[| irandom_range(people.jacob, people.mario)];
		}
		scr_add_gift(nameString, irandom_range(1,4));
	}
}