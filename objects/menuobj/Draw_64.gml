/// @description Insert description here
// You can write your code in this editor
var playerdeviceconnected=0
beatzoom=zooms[zselected]
if(room==menu&&alarm[0]<=0)
{
	draw_set_font(Font12)
	var num=0
	var ecs=128
	var why=128
	var smenuold=smenu
	repeat(array_length(menunum[menuseleted]))
	{
		var size=0
		if(point_in_rectangle(mouse_x,mouse_y,ecs-64,why-32,ecs+64,why+32))
		{
			smenu=num
			size=4
			var playerdeviceconnected=0
			if(gamepad_is_connected(4))
			{
				var playerdeviceconnected=4
			}
			if(gamepad_is_connected(5))
			{
				var playerdeviceconnected=5
			}
			if(mouse_check_button_pressed(mb_left)||gamepad_button_check_pressed(playerdeviceconnected,gp_face1))
			{
				menunum[menuseleted][num].func()
				break;
			}
		}
		if(menuseleted==0)
		{
			if(!audio_is_playing(menutheme)&&alarm[0]<=0)
			{
				audio_stop_all()
				audio_play_sound(menutheme,1000,true)
			}
			draw_rectangle(room_width-256,0,room_width,32,true)
			draw_set_color(c_gray)
			draw_rectangle(room_width-256,0,room_width-256+(256*(xp/xptonextlevel)),32,false)
			draw_set_color(c_white)
			draw_text(room_width-256,0,"level "+string(level))
		}
		if(menuseleted==6)
		{
			room_speed=360
			audio_sound_pitch(offsetmusic,0.5)
			bpm=120
			draw_text(room_width/2,room_height/2,"press space/mouse1/tap on the ding!")
			var num=0
			var nummy=0
			repeat(array_length(menuobj.offsetaverage))
			{
				nummy+=menuobj.offsetaverage[num]
				num+=1
			}
			nummy/=num
			draw_text(room_width/2,(room_height/2)+64,"current offset: "+string(nummy))
			if(audio_is_playing(menutheme))
			{
				audio_stop_all()
				audio=audio_play_sound(offsetmusic,1000,true)
			}
			var offsetty=0
			offsetty=(audio_sound_get_track_position(audio)/audio_sound_get_pitch(audio))-0.5
			if(keyboard_check_pressed(vk_space)||mouse_check_button_pressed(mb_left))
			{
				array_push(offsetaverage,offsetty)
			}
		}
		if(menuseleted==4)
		{
			var ecsy=ecs
			var ecs=ecsy+256
			var num=0
			repeat(2)
			{
				draw_circle(ecs,why,32,true)
				if(badges[num]>0)
				{
					draw_sprite(badge[badges[num]-1].sprite,0,ecs,why)
				}
				num+=1
				ecs+=64
			}
			var ecs=ecsy+256
			why+=64
			num=0
			repeat(2)
			{
				draw_circle(ecs,why,32,true)
				if(point_in_circle(mouse_x,mouse_y,ecs,why,32))
				{
					if(mouse_check_button(mb_left)||gamepad_button_check_pressed(playerdeviceconnected,gp_face1))
					{
						badges[num]=0
					}
				}
				ecs+=64
				num+=1
			}
			why+=64
			var num=0
			var ecs=ecsy+256
			repeat(array_length(badge))
			{
				var ecs=ecsy+256
				if(level<badge[num].level)
				{
					num+=1
					continue;
				}
				var num2=0
				repeat(2)
				{
					draw_sprite(badge[num].sprite,0,ecs,why)
					if(point_in_circle(mouse_x,mouse_y,ecs,why,32))
					{
						draw_rectangle(room_width-1024,room_height-256,room_width,room_height,true)
						draw_text_ext(room_width-1024,room_height-256,badge[num].desc,16,1024)
						if(mouse_check_button(mb_left))
						{
							badges[num2]=num+1
						}
					}
					num2+=1
					ecs+=64
				}
				why+=64
				if(why>128+(256))
				{
					why=128
					ecsy+=128
				}
				num+=1
			}
			ecs=128
			why=128
		}
		if(menuseleted==3&&num==0)
		{
			draw_text(ecs+256,why,"press a key then press the button to bind it")
		}
		if(menuseleted==1&&num>1)
		{
			if(array_length(songlist[menunum[menuseleted][num].nummy][2])<=3)
			{
				array_push(songlist[menunum[menuseleted][num].nummy][2],0)
			}
			if(songlist[menunum[menuseleted][num].nummy][2][3]==2)
			{
				draw_set_color(c_aqua)
			}
			else if(songlist[menunum[menuseleted][num].nummy][2][3]==1)
			{
				draw_set_color(c_green)
			}
			else
			{
				draw_set_color(c_gray)
			}
			draw_rectangle(ecs-256-size+128,why-32-size,ecs+256+size+128,why+64+size,false)
			draw_set_color(c_white)
			draw_text(ecs+128,why-32,"delete")
			draw_rectangle(ecs-64-size+130,why-32-size,ecs+64+size+130,why+32+size,true)
			if(point_in_rectangle(mouse_x,mouse_y,ecs-64-size+128,why-32-size,ecs+64+size+128,why+32+size)&&mouse_check_button_pressed(mb_left))
			{
				array_delete(songlist,menunum[menuseleted][num].nummy,1)
				file_delete(menunum[menuseleted][num].sly[0])
				file_delete(menunum[menuseleted][num].sly[1])
				array_delete(menunum[menuseleted],num,1)
				refresh_songlist()
				break;
			}
			if(smenu!=smenuold&&smenu==num)
			{
				if(songloaded!="")
				{
					audio_destroy_stream(songloaded)
				}
				var loaded=load_song_and_bpm(songlist[menunum[menuseleted][num].nummy][0],songlist[menunum[menuseleted][num].nummy][1])
				if(loaded!=false&&!audio_is_playing(song))
				{
					alt=false
					song=loaded[1]
					audio_stop_all()
					cbpm=loaded[0]
					aud=audio_play_sound(loaded[1],1000,true)
					songloaded=loaded[1]
				}
			}
			draw_text(ecs+256,why,"score: "+string(songlist[menunum[menuseleted][num].nummy][2][0]))
			draw_text(ecs+256,why+16,"accuracy: "+string(songlist[menunum[menuseleted][num].nummy][2][1]))
			draw_text(ecs+256,why+32,"biggest combo: "+string(songlist[menunum[menuseleted][num].nummy][2][2]))
		}
		if(menuseleted==2&&num==0)
		{
			var why2=why-128
			var beaty=stnote
			var pressed=false
			var sethold=false
			var nummyoa=0
			repeat(array_length(eventy))
			{
				if(iscopying)
				{
					if(eventy[nummyoa][0]>=beaty&&eventy[nummyoa][0]<beaty+(16*beatzoom))
					{
						var tevent=eventy[nummyoa][0]
						array_push(nnotes,[tevent,eventy[nummyoa][1],false,false,false])
					}
				}
				nummyoa++
			}
			nummyoa=0
			repeat(array_length(events))
			{
				if(iscopyingevents)
				{
					if(events[nummyoa][0]>=beaty&&events[nummyoa][0]<beaty+(16*beatzoom))
					{
						var tevent=events[nummyoa][0]
						var nevent=[tevent,events[nummyoa][1]]
						var nummyoaas=2
						repeat(array_length(events[nummyoa])-2)
						{
							array_push(nevent,events[nummyoa][nummyoaas])
							nummyoaas++
						}
						array_push(nevents,nevent)
						
					}
				}
				nummyoa++
			}
			iscopying=false
			iscopyingevents=false
			if(pasting)
			{
				for(var iy=1;iy<array_length(nnotes);iy++)
				{
					var tn = [nnotes[iy][0],nnotes[iy][1],false,false,false]
					tn[0]+=getnewbeat(nnotes[0],beaty)
					array_push(eventy,tn)
				}
				for(iy=1;iy<array_length(nevents);iy++)
				{
					var tn = []
					var n=0
					repeat(array_length(nevents[iy]))
					{
						array_push(tn,nevents[iy][n])
						n++
					}
					tn[0]+=getnewbeat(nevents[0],beaty)
					array_push(events,tn)
				}
			}
			pasting=false
			repeat(16)
			{
				var prevbeathadahold=sethold
				sethold=false
				if(aud!=-1)
				{
					var beatlen=(60/dbpm)
					var needle = audio_sound_get_track_position(aud);
					var left = beat * beatlen;
					var right = left + beatlen;
					barper = remap(needle, left, right, 0, 1);
					cbeat=barper+beat
					if(cbeat>beaty&&cbeat<beaty+beatzoom)
					{
						draw_line(ecs+256,why2+(32/beatzoom*abs(cbeat-beaty)),ecs+256+64,why2+(32/beatzoom*abs(cbeat-beaty)))
					}
					if(cbeat>stnote+(16*beatzoom))
					{
						stnote+=16*beatzoom
					}
				}
				var ecs2=ecs+256
				var nummy=0
				repeat(array_length(eventy))
				{
					if(eventy[nummy][0]==beaty)
					{
						if(eventy[nummy][1]==3)
						{
							draw_sprite_ext(partialcirc,prevbeathadahold,(ecs2+(eventy[nummy][1]*32))+16,why2+16,0.25,0.25,270,c_white,1)
							var sethold=true
						}
						else
						{
							draw_circle((ecs2+(eventy[nummy][1]*32))+16,why2+16,8,eventy[nummy][1])
						}
						if(aud!=-1)
						{
							if(cbeat>beaty&&!eventy[nummy][2])
							{
								audio_play_sound(asset_get_index("hit"+string(eventy[nummy][1]+1)),1000,false)
								eventy[nummy][2]=true
							}
						}
						if(point_in_rectangle(mouse_x,mouse_y,ecs2+(eventy[nummy][1]*32),why2,(ecs2+(eventy[nummy][1]*32))+32,why2+32)&&!pressed)
						{
							if(mouse_check_button_pressed(mb_left))
							{
								array_delete(eventy,nummy,1)
								pressed=true
								break;
							}
						}
					}
					nummy+=1
				}
				var nummy=0
				ecs2=ecs+256+(32*4)
				repeat(array_length(events))
				{
					if(events[nummy][0]==beaty&&events[nummy][1]==eventsel)
					{
						draw_circle(ecs2+16,why2+16,8,true)
						var eventtext=[]
						var p=3
						repeat(array_length(events[nummy])-3)
						{
							array_push(eventtext,eventtypes[events[nummy][1]][1][p-3]+": "+string(events[nummy][p]))
							p++;
						}
						draw_text(ecs2+64,why2,eventtext)
						if(point_in_rectangle(mouse_x,mouse_y,ecs2,why2,ecs2+32,why2+32)&&!pressed)
						{
							if(mouse_check_button_pressed(mb_left))
							{
								array_delete(events,nummy,1)
								pressed=true
								break;
							}
						}
					}
					nummy++
				}
				ecs2=ecs+256
				draw_text(ecs2,why2,string(beaty+1))
				draw_rectangle(ecs2,why2,ecs2+32,why2+32,true)
				if(point_in_rectangle(mouse_x,mouse_y,ecs2,why2,ecs2+32,why2+32)&&mouse_check_button_pressed(mb_left)&&!pressed)
				{
					pressed=true
					array_push(eventy,[beaty,0,false])
					break;
				}
				ecs2+=32
				draw_rectangle(ecs2,why2,ecs2+32,why2+32,true)
				if(point_in_rectangle(mouse_x,mouse_y,ecs2,why2,ecs2+32,why2+32)&&mouse_check_button_pressed(mb_left)&&!pressed)
				{
					pressed=true
					array_push(eventy,[beaty,1,false])
					break;
				}
				ecs2+=32
				draw_rectangle(ecs2,why2,ecs2+32,why2+32,true)
				if(point_in_rectangle(mouse_x,mouse_y,ecs2,why2,ecs2+32,why2+32)&&mouse_check_button_pressed(mb_left)&&!pressed)
				{
					pressed=true
					array_push(eventy,[beaty,2,false])
					break;
				}
				ecs2+=32
				draw_rectangle(ecs2,why2,ecs2+32,why2+32,true)
				if(point_in_rectangle(mouse_x,mouse_y,ecs2,why2,ecs2+32,why2+32)&&mouse_check_button_pressed(mb_left)&&!pressed)
				{
					pressed=true
					array_push(eventy,[beaty,3,false,false,prevbeathadahold])
					break;
				}
				ecs2+=32
				draw_rectangle(ecs2,why2,ecs2+32,why2+32,true)
				if(point_in_rectangle(mouse_x,mouse_y,ecs2,why2,ecs2+32,why2+32)&&mouse_check_button_pressed(mb_left)&&!pressed)
				{
					pressed=true
					var arr=[beaty,eventsel,false]
					var nummyoa=0
					repeat(array_length(eventtypes[eventsel][1]))
					{
						array_push(arr,get_integer(eventtypes[eventsel][1][nummyoa],eventtypes[eventsel][2][nummyoa]))
						nummyoa++;
					}
					array_push(events,arr)
					break;
				}
				why2+=32
				beaty+=beatzoom
			}
			draw_text_ext(ecs+64,why-64,"bpm: "+string(dbpm),16,1024)
			draw_text_ext(ecs+512,why-64,"beat: "+string(cbeat),16,1024)
			draw_text_ext(ecs+512,why-32,"zoom: "+string(beatzoom),16,1024)
			draw_text_ext(ecs+512,why-16,"event selected: "+eventtypes[eventsel][0],16,1024)
		}
		draw_set_color(c_gray)
		draw_rectangle(ecs-64-size,why-32-size,ecs+64+size,why+32+size,false)
		draw_set_color(c_white)
		draw_rectangle(ecs-64-size,why-32-size,ecs+64+size,why+32+size,true)
		draw_set_color(c_white)
		draw_set_halign(fa_center)
		if(num<array_length(menunum[menuseleted]))
		{
			draw_text(ecs,why,menunum[menuseleted][num].namey)
		}
		draw_set_halign(fa_left)
		num+=1
		why+=90
		if(why>room_height/1.1)
		{
			ecs+=128
			if(menuseleted==1)
			{
				ecs+=256+128
			}
			why=128
		}
	}
	al-=0.01
	draw_set_halign(fa_center)
	draw_text_ext_color(room_width/2,room_height/2,string(xpgained),64,999999,c_white,c_white,c_white,c_white,al)
	draw_set_halign(fa_left)
}