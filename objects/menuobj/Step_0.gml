/// @description Insert description here
// You can write your code in this editor
var playerdeviceconnected=0
if(gamepad_is_connected(4))
{
	var playerdeviceconnected=4
}
if(gamepad_is_connected(5))
{
	var playerdeviceconnected=5
}
if(gamepad_is_connected(playerdeviceconnected))
{
	var haxis = gamepad_axis_value(playerdeviceconnected, gp_axislh);
	
	var vaxis = gamepad_axis_value(playerdeviceconnected, gp_axislv);
	display_mouse_set(display_mouse_get_x()+haxis,display_mouse_get_x()+vaxis)
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