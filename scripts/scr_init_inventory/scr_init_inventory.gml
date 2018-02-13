#region Init Jacob's gifts
for(var i = 0; i < 1; ++i)
{
	scr_add_gift("jacob", i);
}  
#endregion

#region Init Cole's gifts
for(var i = 0; i < 1; ++i)
{
	scr_add_gift("cole", i);
}  
#endregion

#region Init Isabel's gifts
for(var i = 0; i < 1; ++i)
{
	scr_add_gift("isabel", i);
}  
#endregion

#region Init Veronica's gifts
for(var i = 0; i < 1; ++i)
{
	scr_add_gift("veronica", i);
}  
#endregion

#region Init Ryan's gifts
for(var i = 0; i < 1; ++i)
{
	scr_add_gift("ryan", i);
}  
#endregion

#region Init Mario's gifts
for(var i = 0; i < 1; ++i)
{
	scr_add_gift("mario", i);
}  
#endregion

global.trinkets = array_create(global.numTrinketTypes, 99);
for (var i = 0; i < global.numTrinketTypes - 1; ++i) {
    global.trinkets[i] = i * 20;
}
