///arg0 arr  The array of arrays you want to access
///arg1 x  The first location
///arg2 y  The second location
///arg3 z  The third location

var _arr = argument0;
var _x = argument1;
var _y = argument2;
var _z = argument3;

/*
04/08/2018 7:02A
Here's whatchya gotta do:
You need to create a 3D array of values that are read in from the responses JSON based on whomever you're talking to.
Once you have that array, you can use the values of the enums based on the triggers to access this array.
That will give you the message, but unfortunately you're still not done with conversations there.

You have a lot to do:
1. Write out example trigger responses
2. Determine what information you need to discern how they will feel about each trigger
3. Implement that as character data
4. Write the code that discerns the triggers needed based on their data
5. Write the code that dynamically creates the sprites for the message bubbles based on how long the messages are

Then voila, you've created the very basics of your convo system.
*/