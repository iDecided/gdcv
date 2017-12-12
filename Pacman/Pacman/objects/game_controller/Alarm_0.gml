/// @description Insert description here
// You can write your code in this editor

var randType = shouldSpawnRand;
with(instance_create_depth(1632, 160, -10, spawner_obj)) {
	shouldMoveRand = randType;
}
	
with(instance_create_depth(2368, 96, -10, spawner_obj)) {
	shouldMoveRand = randType;
}
	
with(instance_create_depth(1984, 736, -10, spawner_obj)) {
	shouldMoveRand = randType;
}


shouldSpawnRand = !shouldSpawnRand;

alarm[0] = room_speed * 17;