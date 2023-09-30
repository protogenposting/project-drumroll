/// @description Insert description here
// You can write your code in this editor
keyhit=[keyboard_check_pressed(menuobj.bassbind[0])||keyboard_check_pressed(menuobj.bassbind[1])||keyboard_check_pressed(menuobj.bassbind[2]),keyboard_check_pressed(menuobj.snarebind[0])||keyboard_check_pressed(menuobj.snarebind[1])||keyboard_check_pressed(menuobj.snarebind[2]),keyboard_check_pressed(menuobj.cymbalbind),keyboard_check_pressed(menuobj.rollbind[0])||keyboard_check_pressed(menuobj.rollbind[1])]
if(keyhit[0])
{
	audio_play_sound(hit1,1000,false)
	sprite_index=choose(hitdrumright1,hitdrumleft1)
}
if(keyhit[1])
{
	audio_play_sound(hit2,1000,false)
	sprite_index=choose(hitsnareright1,hitsnareleft1)
}
if(keyhit[2])
{
	audio_play_sound(hit3,1000,false)
	sprite_index=choose(hitrimright1,hitrimleft1)
}
if(keyhit[3])
{
	audio_play_sound(hit4,1000,false)
	sprite_index=choose(hitdrumright1,hitdrumleft1)
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