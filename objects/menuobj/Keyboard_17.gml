/// @description Insert description here
// You can write your code in this editor
if(!instance_exists(stats))
{
	if(keyboard_check_pressed(ord(5)))
	{
		auto=!auto
	}
}
if(keyboard_check_pressed(ord("Q")))
{
	showFps=!showFps
}
if(keyboard_check_pressed(ord("F")))
{
	window_set_fullscreen(!window_get_fullscreen())
}