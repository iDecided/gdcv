/// @description Prompt the user for which gift they'd like to give the person
// You can write your code in this editor

var gift = get_string("Which gift do you want to give them?", "");
choosing = true;
// I do believe that this will need to be moved to the gifts that will display in the gift selector
accepted = scr_respond_to_gift(gift);
choosing = false;