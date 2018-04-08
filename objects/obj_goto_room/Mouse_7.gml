/// @description Goes to roomToGoTo in the instance's variables
// You can write your code in this editor

// 04/08/2018
// I should consider also having this skip forward half an hour. Would that make making it to dates on time more stressful?
// Yeah, I'mma add it. They have all that ToD to get to it. It's their fault should they miss it.
scr_advance_half_hour();

// roomToGoTo is a variable stored in the GML object properties
room_goto(roomToGoTo);

// These are here just in case I ever want to add and debug the fade effect between rooms
//fadeEff = instance_create_depth(0,0,-1000,obj_eff_fade);
//fadeEff.whereToGo = roomToGoTo;