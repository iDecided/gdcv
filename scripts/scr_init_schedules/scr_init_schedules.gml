/// @description Initializes the schedule map and grids. Arg0 is the map of schedules

// Create a map with keys of each person's name
// Add to each key the id of a grid that is 7 days by 32 timeslots
ds_map_add(argument0, "jacob", ds_grid_create(7,32));
ds_map_add(argument0, "cole", ds_grid_create(7,32));
ds_map_add(argument0, "isabel", ds_grid_create(7,32));
ds_map_add(argument0, "veronica", ds_grid_create(7,32));
ds_map_add(argument0, "ryan", ds_grid_create(7,32));
ds_map_add(argument0, "mario", ds_grid_create(7,32));

var roomNames = ["rm_cc", "rm_ud", "rm_lib", "rm_ps", "rm_gdl", "rm_sr", "rm_dc", "rm_cs"];

ds_grid_set_region(ds_map_find_value(argument0, "jacob"), 0, 0, 6, 30, "rm_cc");
ds_grid_set_region(ds_map_find_value(argument0, "cole"), 0, 0, 6, 30, "rm_ud");
//ds_grid_set_region(ds_map_find_value(argument0, "isabel"), 0, 0, 6, 30, roomNames[irandom(7)]);
for (var i = 0; i < 30; ++i) {
	ds_grid_set_region(ds_map_find_value(argument0, "isabel"), 0, i, 6, i, roomNames[irandom(7)]);
}
ds_grid_set_region(ds_map_find_value(argument0, "veronica"), 0, 0, 6, 30, "rm_ps");
ds_grid_set_region(ds_map_find_value(argument0, "ryan"), 0, 0, 6, 30, "rm_gdl");
ds_grid_set_region(ds_map_find_value(argument0, "mario"), 0, 0, 6, 30, "rm_sr");

//show_debug_message("Everyone's locations in order should be: " + ds_grid_get(argument0[? "jacob"], 0, 0) + " " + ds_grid_get(argument0[? "cole"], 0, 0) + " " + ds_grid_get(argument0[? "isabel"], 0, 0) + " " + ds_grid_get(argument0[? "veronica"], 0, 0) + " " + ds_grid_get(argument0[? "ryan"], 0, 0) + " " + ds_grid_get(argument0[? "mario"], 0, 0) + " ");
