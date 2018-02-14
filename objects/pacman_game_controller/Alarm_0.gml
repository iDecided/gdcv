/// @description Insert description here
// You can write your code in this editor

var randType = shouldSpawnRand;
with(instance_create_depth(spawnerXR1, spawnerYR1, -10, pacman_spawner_obj)) {
	shouldMoveRand = randType;
}
	
with(instance_create_depth(spawnerXR2, spawnerYR2, -10, pacman_spawner_obj)) {
	shouldMoveRand = randType;
}
	
with(instance_create_depth(spawnerXR3, spawnerYR3, -10, pacman_spawner_obj)) {
	shouldMoveRand = randType;
}


shouldSpawnRand = !shouldSpawnRand;

alarm[0] = room_speed * 17;