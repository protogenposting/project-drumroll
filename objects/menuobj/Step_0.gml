/// @description Insert description here
// You can write your code in this editor
if(window_get_fullscreen())
{
	view_set_wport(view_current,1920)
	view_set_hport(view_current,1080)
}
else
{
	view_set_wport(view_current,1366)
	view_set_hport(view_current,768)
}
var playerdeviceconnected=0
if(gamepad_is_connected(4))
{
	var playerdeviceconnected=4
}
if(gamepad_is_connected(5))
{
	var playerdeviceconnected=5
}
gamepad_set_axis_deadzone(playerdeviceconnected,0.1)
if(gamepad_is_connected(playerdeviceconnected))
{
	var haxis = gamepad_axis_value(playerdeviceconnected, gp_axislh)*5;
	
	var vaxis = gamepad_axis_value(playerdeviceconnected, gp_axislv)*5;
	display_mouse_set(display_mouse_get_x()+haxis,display_mouse_get_y()+vaxis)
}
xptonextlevel=10+((level-1)*4)
if(xp>=xptonextlevel)
{
	level+=1
	xp-=xptonextlevel
}
if(room==menu)
{
	var num=0
	repeat(array_length(badge))
	{
		badge[num].active=false
		if(num+1==badges[0]||num+1==badges[1])
		{
			badge[num].active=true
		}
		num+=1
	}
}