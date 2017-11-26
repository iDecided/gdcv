/// Adds items, arg0 is the owner name, arg1 is the level of gift

for(var i = 0; i < maxGifts; ++i)
{
	if(gifts[i] == "")
	{
		gifts[i] = string(argument0) + "_" + string(argument1);
		show_debug_message("Adding: " + gifts[i]);
		return(1);
	}
}
show_debug_message("Inventory is full.");
return(0);