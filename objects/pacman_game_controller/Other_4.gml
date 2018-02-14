/// @description Insert description here
// You can write your code in this editor

//I hate this new view/camera system.
view_enabled = true;
view_set_visible(0, true);
view_xport[0] = 0;
view_yport[0] = 0;
view_wport[0] = 1280;
view_hport[0] = 720;

camera1 = camera_create_view(0, 0, 1280, 720, 0, -1, -1, -1, 32, 32);
view_set_camera(0, camera1);

//change this area to resize the actual pacman game
view_enabled = true;
view_set_visible(1, true);
view_xport[1] = 64;
view_yport[1] = 64;
view_wport[1] = 736;
view_hport[1] = 576;

cameraX1 = 1280;
cameraY1 = 0;
cameraX2 = 736*2;
cameraY2 = 576*2;

camera2 = camera_create_view(cameraX1, cameraY1, cameraX2, cameraY2, 0, -1, -1, -1, 32, 32);
view_set_camera(1, camera2);

//cameraTransition = true;

//alarm[1] = 3 * room_speed;