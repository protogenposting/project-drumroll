/// @description Insert description here
// You can write your code in this editor
cbeat=0
keyhit=[0,0,0,0]
keyshit=[0,0,0,0]
if(combo>lcombo)
{
	lcombo=combo
}
if(!fc&&menuobj.badge[13].active)
{
	audio_stop_all()
	room_goto(menu)
	instance_destroy()
}
if(countdown<=0)
{
	if(menuobj.badge[7].active)
	{
		accadd+=0.001
	}
	var defwidth=1366
	var defheight=768
	var zoomper=zoom/100
	camera_set_view_pos(view_camera[0],0,0)
	camera_set_view_size(view_camera[0],defwidth-(defwidth*zoomper),defheight-(defheight*zoomper))
	camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0])+((defwidth*zoomper)/2),camera_get_view_y(view_camera[0])+((defheight*zoomper)/2))
	camera_set_view_angle(view_camera[0],crot)
	var acc=0
	var num=0
	repeat(array_length(accuracy))
	{
		acc+=accuracy[num]
		num+=1
	}
	acc/=array_length(accuracy)
	acc+=accadd
	if(played&&!audio_is_playing(song))
	{
		if(scorey*(!menuobj.auto)>menuobj.songlist[sid][2][0])
		{
			menuobj.songlist[sid][2][0]=scorey
		}
		if(acc*(!menuobj.auto)>menuobj.songlist[sid][2][1])
		{
			menuobj.songlist[sid][2][1]=acc
		}
		if(lcombo*(!menuobj.auto)>menuobj.songlist[sid][2][2])
		{
			menuobj.songlist[sid][2][2]=lcombo
		}
		if(fc&&!menuobj.auto)
		{
			menuobj.songlist[sid][2][3]=2
		}
		else if(menuobj.songlist[sid][2][3]!=2)
		{
			menuobj.songlist[sid][2][3]=1
		}
		var xptogive=((lcombo/100)*(acc/100)*(scorey/1000)*(audio_sound_length(song)/20))/6
		menuobj.xp+=xptogive*(!menuobj.auto)
		menuobj.xpgained=xptogive*(!menuobj.auto)
		menuobj.al=1
		audio_stop_all()
		alarm[3]=5
		if(fc)
		{
			audio_stop_sound(song)
			audio_play_sound(FULLCOMBO,1000,false)
			alarm[3]=audio_sound_length(FULLCOMBO)*60
		}
	}
	if(!audio_is_playing(song)&&beat<0)
	{
		aud=audio_play_sound(song,1000,false)
		played=true
	}
	keyhit=[keyboard_check_pressed(menuobj.bassbind[0])||keyboard_check_pressed(menuobj.bassbind[1])||keyboard_check_pressed(menuobj.bassbind[2]),keyboard_check_pressed(menuobj.snarebind[0])||keyboard_check_pressed(menuobj.snarebind[1])||keyboard_check_pressed(menuobj.snarebind[2]),keyboard_check_pressed(menuobj.cymbalbind),keyboard_check_pressed(menuobj.rollbind[0])||keyboard_check_pressed(menuobj.rollbind[1])]
	keyhithold=[keyboard_check(menuobj.bassbind[0])||keyboard_check(menuobj.bassbind[1])||keyboard_check(menuobj.bassbind[2]),keyboard_check(menuobj.snarebind[0])||keyboard_check(menuobj.snarebind[1])||keyboard_check(menuobj.snarebind[2]),keyboard_check(menuobj.cymbalbind),keyboard_check(menuobj.rollbind[0])||keyboard_check(menuobj.rollbind[1])]
	/*var playerdeviceconnected=0
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
		keyhit=[gamepad_button_check_pressed(4,gp_face1)||gamepad_button_check_pressed(5,gp_face1),gamepad_button_check_pressed(4,gp_face2)||gamepad_button_check_pressed(5,gp_face2),gamepad_button_check_pressed(4,gp_face3)||gamepad_button_check_pressed(5,gp_face3),gamepad_button_check_pressed(4,gp_face4)||gamepad_button_check_pressed(5,gp_face4)]
	}*/
	morehits=false
	var num=0
	var ecs=camera_get_view_width(view_camera[0])/4
	if(os_type==os_android)
	{
		repeat(4)
		{
			draw_line(ecs,0,ecs,room_height)
			if(mouse_check_button_pressed(mb_left)&&device_mouse_x_to_gui(0)<ecs&&device_mouse_x_to_gui(0)>ecs-camera_get_view_width(view_camera[0])/4)
			{
				keyhit[num]=true
			}
			ecs+=camera_get_view_width(view_camera[0])/4
			num+=1
		}
	}
	if(keyhit[0])
	{
		ind=1
		image_index=6
		alarm[0]=32
		alt=!alt
	}
	if(keyhit[1])
	{
		ind=2
		alt=!alt
		image_index=6
		alarm[0]=32
	}
	if(keyhit[2])
	{
		ind=3
		alt=!alt
		image_index=6
		alarm[0]=32
	}
	if(keyhit[3])
	{
		ind=4
		alt=!alt
		image_index=6
		alarm[0]=32
	}
	if(menuobj.badge[10].active&&audio_sound_get_pitch(aud)<1.5)
	{
		audio_sound_pitch(aud,audio_sound_get_pitch(aud)+0.001)
	}
	if(menuobj.badge[14].active&&audio_sound_get_pitch(aud)<2)
	{
		audio_sound_pitch(aud,audio_sound_get_pitch(aud)+0.001)
	}
	if(menuobj.badge[14].active&&menuobj.badge[10].active&&audio_sound_get_pitch(aud)<4)
	{
		audio_sound_pitch(aud,audio_sound_get_pitch(aud)+0.001)
	}
	var tspeed=random_range(0,2)
	if(menuobj.badge[19].active&&audio_sound_get_pitch(aud)>tspeed)
	{
		audio_sound_pitch(aud,audio_sound_get_pitch(aud)-0.1)
	}
	if(menuobj.badge[19].active&&audio_sound_get_pitch(aud)<tspeed)
	{
		audio_sound_pitch(aud,audio_sound_get_pitch(aud)+0.1)
	}
	var barperlast=barper
	var beatlen=60/bpm
	var needle = audio_sound_get_track_position(aud)//+menuobj.offset;
	var left = beat * beatlen;
	var right = left + beatlen;
	barper = remap(needle, left, right, 0, 1);
	if(frac(barper)<frac(barperlast)&&menuobj.badge[12].active)
	{
		rowpost[rowsel]=[0,irandom(room_height-(rowsel*64))]
		rowsel+=1
		if(rowsel>3)
		{
			rowsel=0
		}
	}
	if(frac(barper)<frac(barperlast))
	{
		if(menuobj.badge[18].active)
		{
			menuobj.downscroll=!menuobj.downscroll
		}
	}
	cbeat=(barper+beat)+shift
	if(abs(crot)>0)
	{
		crot-=crotrate*sign(crot)
	}
	if(abs(zoom)>0)
	{
		zoom-=zoomrate*sign(zoom)
	}
	if(cbeat>=censori)
	{
		censori=-4
	}
	for(var int=0;int<array_length(events);int++)
	{
		if(cbeat>=events[int][0]&&!events[int][2])
		{
			if(events[int][1]==0)
			{
				zoom=events[int][3]
				zoomrate=events[int][4]
			}
			if(events[int][1]==1)
			{
				crot=events[int][3]*events[int][4]
				crotrate=events[int][5]
			}
			if(events[int][1]==2)
			{
				censori=cbeat+events[int][3]
			}
			events[int][2]=true
		}
	}
}
var num=0
repeat(array_length(rowpos))
{
	rowpos[num][0]-=(rowpos[num][0]-rowpost[num][0])/10
	rowpos[num][1]-=(rowpos[num][1]-rowpost[num][1])/10
	num+=1
}