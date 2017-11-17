draw_set_color(make_color_rgb(245,245,220));
// Later, you'll need to make the height of this a percentage of the screen based off the ratio
draw_rectangle(0, 0, room_width, 100, 0);
draw_set_color(c_black);

// These are all hard-coded values for now. If I have time to make them dynamic to the screensize, they'll need to be proportional
draw_sprite(spr_tm_timeline, 1, 29, 7);
draw_sprite(spr_tm_next_hour, 1, 764, 10);
draw_sprite(spr_tm_next_tod, 1, 764, 48);
instance_create_depth(937, 7, -1, obj_tm_people);
instance_create_depth(1105, 7, -1, obj_tm_items);