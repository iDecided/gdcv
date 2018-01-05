/// Called from the game_ctlr to populate the current room with characters
/// In the future, with take the character's schedules into account as well

var names = ["jacob", "cole", "isabel", "veronica", "ryan", "mario"];

with(obj_ovw_char_prnt) {
	if(character == "") {
		image_xscale = 0.1;
		image_yscale = 0.1;
		character = names[irandom_range(0, array_length_1d(names)-1)];
		sprite_index = asset_get_index("spr_char_" + character + "_ovw");
	}
}