// 05/04/2018
// So I'm finally getting around to setting up the final parts of talking: choosing your responses.
// I've created obj_choice that will be the buttons you choose for the type of response you want
// to make when the NPC asks you a question during one of their monologues.
// All emojies will exist in a single sprite, with each emoji being a separate sub-image.

/*

This script will take three arguments: the three emojies you want to draw. These are stored and passed
as strings that will be read in during the monologue and then used to access a map loaded from JSON with 
all the information that each button will need.

Order of operations:
1. Spawn a speech_bubble
2. Load JSON map
3. Create buttons
4. Load information into the buttons

*/

/// @arg choice1  The string key to find the information for the first choice
/// @arg choice2  The string key to find the information for the second choice
/// @arg choice3  The string key to find the information for the third choice

var _choice1 = argument0;
var _choice2 = argument1;
var _choice3 = argument2;

