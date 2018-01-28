// arg0 amt  The amount that you want to increase affection by
// arg1 adjLvl  A boolean for if you want the affection to increase the affection level or not

var _amt = argument0;
var _adjLvl = argument1;

if(!_adjLvl) {
	global.affectionMap[? global.talkingTo] += _amt;
	if(global.affectionMap[? global.talkingTo] > 20 * (global.affectionLevelMap[? global.talkingTo] + 1)) {
		global.affectionMap[? global.talkingTo] = 20 * (global.affectionLevelMap[? global.talkingTo] + 1);
	}
	if(global.affectionMap[? global.talkingTo] > 100) {
		global.affectionMap[? global.talkingTo] = 100;
	}
}
else {
	global.affectionMap[? global.talkingTo] += 4;
	if(global.affectionMap[? global.talkingTo] > 100) {
		global.affectionMap[? global.talkingTo] = 100;
		global.affectionLevelMap[? global.talkingTo] = 5;
	}
	else {
		global.affectionLevelMap[? global.talkingTo] = floor(global.affectionMap[? global.talkingTo] / 20);
	}
}

show_debug_message(global.talkingTo + "'s Affection is: " + string(global.affectionMap[? global.talkingTo]) + " and their level is: " + string(global.affectionLevelMap[? global.talkingTo]));