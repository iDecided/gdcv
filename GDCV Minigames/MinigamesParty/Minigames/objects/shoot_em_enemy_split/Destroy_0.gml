/// @description Insert description here
// You can write your code in this editor

if(image_xscale == 1) {

	var rand_direction = random(360);
	for(var i = 0; i < 3; i++) {
		var offspring = instance_create_depth(x, y, -5, shoot_em_enemy_split);
		//THEY'RE SO CUTE OMG!!!!!111! ^-^
		offspring.image_xscale = 0.5;
		offspring.image_yscale = 0.5;
		offspring.direction = rand_direction + (i * 120);
		offspring.enemy_health = 1;

	}
}
