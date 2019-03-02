/// @description Debug Code
// You can write your code in this editor

if(keyboard_check_released(ord("S")))
{
	show_debug_message("Saving started...");
	scr_save_game();
	show_debug_message("Saving completed.");
}
if(keyboard_check_released(ord("L")))
{
	show_debug_message("Loading started...");
	scr_load_game();
	show_debug_message("Loading completed.");
}
if(keyboard_check_released(ord("G")))
{
	var nameString = global.names[| irandom_range(people.jacob, people.mario)];
	while(nameString == undefined) {
		nameString = global.names[| irandom_range(people.jacob, people.mario)];
	}
	scr_add_gift(nameString, irandom_range(1,4));
}


// Debug code for sending messages between the NPC and PC
if(isTalking == true)
{
	if(keyboard_check_released(ord("1")))
	{
		scr_draw_response(sender.npc, "Small message from NPC", "small");
	}
	if(keyboard_check_released(ord("2")))
	{
		scr_draw_response(sender.pc, "Small message from PC", "small");
	}
	if(keyboard_check_released(ord("3")))
	{
		scr_draw_response(sender.npc, "Med message from NPC", "medium");
	}
	if(keyboard_check_released(ord("4")))
	{
		scr_draw_response(sender.pc, "Med message from PC", "medium");
	}
	if(keyboard_check_released(ord("5")))
	{
		scr_draw_response(sender.npc, "Large message from NPC", "large");
	}
	if(keyboard_check_released(ord("6")))
	{
		scr_draw_response(sender.pc, "Large message from PC", "large");
	}
	if(keyboard_check_released(ord("7")))
	{
<<<<<<< HEAD
		scr_draw_response(sender.pc, "Large message from PC","large");
=======
		scr_draw_response(sender.npc, "Neutral Response", "large");
>>>>>>> origin/master
		responseReaction = respStrengths.soft;
	}
	if(keyboard_check_released(ord("8")))
	{
<<<<<<< HEAD
		scr_draw_response(sender.pc, "Large message from PC", "large");
=======
		scr_draw_response(sender.npc, "Blushing Response", "large");
>>>>>>> origin/master
		responseReaction = respStrengths.medium;
	}
	if(keyboard_check_released(ord("9")))
	{
<<<<<<< HEAD
		scr_draw_response(sender.pc, "Large message from PC", "large");
=======
		scr_draw_response(sender.npc, "Mad Response", "large");
>>>>>>> origin/master
		responseReaction = respStrengths.strong;
	}
}