/// @description Insert description here
// You can write your code in this editor
if(cbpm!=0&&room!=Room1&&menuseleted!=2)
{
	var beatlen=(60/cbpm)/2
	var oldcbeat=cbeat
	var needle = audio_sound_get_track_position(aud);
	var left = beat * beatlen;
	var right = left + beatlen;
	barper = remap(needle, left, right, 0, 1);
	cbeat=barper+beat
	if(frac(cbeat)<frac(oldcbeat)&&menuseleted==1)
	{
		sprite_index=choose(hitdrumright1,hitdrumleft1)
		if(alt==2)
		{
			sprite_index=choose(hitsnareright1,hitsnareleft1)
		}
		if(alt==1||alt==3)
		{
			sprite_index=choose(hitrimleft1,hitrimright1)
		}
		if(alt==0)
		{
			audio_play_sound(hit1,1000,false)
		}
		if(alt==2)
		{
			audio_play_sound(hit2,1000,false)
		}
		if(alt==1||alt==3)
		{
			audio_play_sound(hit3,1000,false)
		}
		image_index=0
		alt+=1
		if(alt>3)
		{
			alt=0
		}
	}
	keyhit=[keyboard_check_pressed(menuobj.bassbind[0])||keyboard_check_pressed(menuobj.bassbind[1])||keyboard_check_pressed(menuobj.bassbind[2]),keyboard_check_pressed(menuobj.snarebind[0])||keyboard_check_pressed(menuobj.snarebind[1])||keyboard_check_pressed(menuobj.snarebind[2]),keyboard_check_pressed(menuobj.cymbalbind),keyboard_check_pressed(menuobj.rollbind[0])||keyboard_check_pressed(menuobj.rollbind[1])]
	var playerdeviceconnected=0
	if(gamepad_is_connected(playerdeviceconnected))
	{
		keyhit=[gamepad_button_check_pressed(playerdeviceconnected,gp_face1),gamepad_button_check_pressed(playerdeviceconnected,gp_face2),gamepad_button_check_pressed(playerdeviceconnected,gp_face4),gamepad_button_check_pressed(playerdeviceconnected,gp_face3)]
	}
	if(keyhit[0])
	{
		audio_play_sound(hit1,1000,false)
		sprite_index=choose(hitdrumright1,hitdrumleft1)
		image_index=0
	}
	if(keyhit[1])
	{
		audio_play_sound(hit2,1000,false)
		sprite_index=choose(hitsnareright1,hitsnareleft1)
		image_index=0
	}
	if(keyhit[2])
	{
		audio_play_sound(hit3,1000,false)
		sprite_index=choose(hitrimright1,hitrimleft1)
		image_index=0
	}
	if(keyhit[3])
	{
		audio_play_sound(hit4,1000,false)
		sprite_index=choose(hitdrumright1,hitdrumleft1)
		image_index=0
	}
	draw_sprite(sprite_index,image_index,room_width/2,room_height/2)
}