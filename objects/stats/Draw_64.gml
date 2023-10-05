/// @description Insert description here
// You can write your code in this editor
	var ballcaphit=false
	if(!menuobj.downscroll)
	{
		if(menuobj.arrows>=1)
		{
			var ecs=128+rowpos[0][0]
			var why=32+rowpos[0][1]
			for(var iyy=0;iyy<=3;iyy++)
			{
				var buttonid;
				switch(iyy){
					case 0:
					buttonid=menuobj.bassbind[0]
					break;
					case 1:
					buttonid=menuobj.snarebind[0]
					break;
					case 2:
					buttonid=menuobj.cymbalbind
					break;
					case 3:
					buttonid=menuobj.rollbind[0]
					break;
				}
				draw_text(ecs-64,why,chr(buttonid))
				if(point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),ecs-32,why-32,ecs+32,why+32)&&mouse_check_button(mb_left))
				{
					keyhit[iyy]=true
				}
				draw_sprite_ext(menuobj.notestyles[menuobj.arrows],iyy,ecs,why,1+keyhithold[iyy]*0.1,1+keyhithold[iyy]*0.1,-90,c_white,1)
				why+=64
			}
		}
		else
		{
			draw_circle(128+rowpos[0][0],32+rowpos[0][1],32,true)
			draw_circle(128+rowpos[1][0],32+64+rowpos[1][1],32,true)
			draw_rectangle(128-32+rowpos[2][0],128+32+rowpos[2][1]-32,128+32+rowpos[2][0],128+32+rowpos[2][1]+32,true)
			draw_rectangle(128-32+rowpos[2][0],128+64+rowpos[2][1],128+32+rowpos[2][0],128+128+rowpos[2][1],true)
		}
		draw_text(256,32,am)
	}
	else
	{
		if(menuobj.arrows>=1)
		{
			var ecs=32+rowpos[0][1]
			var why=128+rowpos[0][0]
			for(var iyy=0;iyy<=3;iyy++)
			{
				var buttonid;
				switch(iyy){
						case 0:
						buttonid=menuobj.bassbind[0]
						break;
						case 1:
						buttonid=menuobj.snarebind[0]
						break;
						case 2:
						buttonid=menuobj.cymbalbind
						break;
						case 3:
						buttonid=menuobj.rollbind[0]
						break;
				}
				draw_text(ecs,why-64,chr(buttonid))
				if(point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),ecs-32,why-32,ecs+32,why+32)&&mouse_check_button(mb_left))
				{
					keyhit[iyy]=true
				}
				draw_sprite_ext(menuobj.notestyles[menuobj.arrows],iyy,ecs,why,1+keyhithold[iyy]*0.1,1+keyhithold[iyy]*0.1,0,c_white,1)
				ecs+=64
			}
		}
		else
		{
			draw_circle(32+rowpos[0][1],128+rowpos[0][0],32,true)
			draw_circle(32+64+rowpos[1][1],128+rowpos[1][0],32,true)
			draw_rectangle(128+32+rowpos[2][1]-32,128-32+rowpos[2][0],128+32+rowpos[2][1]+32,128+32+rowpos[2][0],true)
			draw_rectangle(128+64+rowpos[2][1],128-32+rowpos[2][0],128+128+rowpos[2][1],128+32+rowpos[2][0],true)
		}
		draw_text(256,32,am)
	}
	var num=0
	var notes=0
	hit=false
	var ecs=camera_get_view_width(view_camera[0])/4
	var oldscore=scorey
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
	num=0
	var dmspeed=mspeed
	repeat(array_length(note))
	{
		if(menuobj.badge[20].active)
		{
			mspeed=lanespeeds[note[num][1]]
		}
		var leniencyl=leniency+((menuobj.badge[8].active&&firenotes[num])*0.1)+((menuobj.badge[9].active&&pugnotes[num])*0.1)
		var leniencye=leniency+((menuobj.badge[8].active&&firenotes[num])*0.1)+((menuobj.badge[9].active&&pugnotes[num])*0.1)
		if(-(cbeat-note[num][0])<-leniencyl&&(note[num][1]!=3||!menuobj.spdrumroll)&&!note[num][2]&&arlorow!=note[num][1])
		{
			fc=false
			if(!menuobj.badge[3].active||!bobnotes[num])
			{
				note[num][2]=true
				array_push(accuracy,0)
				misses+=1
				rating="miss..."
				combo=0
				nnum=num+1
			}
			else
			{
				audio_play_sound(bobmiss,1000,false)
				note[num][2]=true
			}
		}
		var cares=false
		if(!menuobj.downscroll)
		{
			if((((-(cbeat-note[num][0])/mspeed)*room_width)+128)<room_width&&(((-(cbeat-note[num][0])/mspeed)*room_width)+128)>0)
			{
				cares=true
				if(note[num][2]&&menuobj.arrows==0)
				{
					var sizey=(((-(cbeat-note[num][0])/mspeed)*room_width)+128)/128
					if(note[num][1]<2)
					{
						draw_circle(((-(cbeat-note[num][0])/mspeed)*room_width)+128+rowpos[note[num][1]][0],32+(note[num][1]*64)+rowpos[note[num][1]][1],(32+(note[num][1]*3))*sizey,note[num][1])
					}
					else
					{
						draw_rectangle(((-(cbeat-note[num][0])/mspeed)*room_width)+128-(32*sizey)+rowpos[note[num][1]][0],(32-(32*sizey))+128+rowpos[note[num][1]][1],((-(cbeat-note[num][0])/mspeed)*room_width)+128+(32*sizey)+rowpos[note[num][1]][0],(32+(32*sizey))+128+rowpos[note[num][1]][1],true)
					}
				}
				if(-(cbeat-note[num][0])<0&&!note[num][3]&&note[num][1]!=3||!menuobj.spdrumroll&&-(cbeat-note[num][0])<0&&!note[num][3])
				{
					notes+=1
					note[num][3]=true
					audio_play_sound(asset_get_index("hit"+string(note[num][1]+1)),1000,false)
				}
				if(!note[num][2])
				{
					if(menuobj.arrows>=1)
					{
						draw_sprite_ext(menuobj.notestyles[menuobj.arrows],note[num][1],((-(cbeat-note[num][0])/mspeed)*room_width)+128+rowpos[note[num][1]][0],(note[num][1]*64)+rowpos[note[num][1]][1]+32,1,1,-90,c_white,1)
					}
					else
					{
						if(note[num][1]<2)
						{
							draw_circle(((-(cbeat-note[num][0])/mspeed)*room_width)+128+rowpos[note[num][1]][0],32+(note[num][1]*64)+rowpos[note[num][1]][1],32+(note[num][1]*3),note[num][1])
						}
						else if(note[num][1]==3)
						{
							draw_sprite(partialcirc,1,((-(cbeat-note[num][0])/mspeed)*room_width)+128+rowpos[note[num][1]][0],(32*note[num][4])+32+(note[num][1]*64)+rowpos[note[num][1]][1])
						}
						else
						{
							draw_rectangle((((-(cbeat-note[num][0])/mspeed)*room_width)+128-32)+rowpos[note[num][1]][0],(0+(note[num][1]*64))+rowpos[note[num][1]][1],(((-(cbeat-note[num][0])/mspeed)*room_width)+128+32)+rowpos[note[num][1]][0],(64+(note[num][1]*64))+rowpos[note[num][1]][1],true)
						}
					}
					if(menuobj.badge[0].active&&ballcapcanhit)
					{
						draw_sprite(ballcapoverlay,0,((-(cbeat-note[num][0])/mspeed)*room_width)+128,32+(note[num][1]*64))
					}
					if(alarm[1]<=0&&menuobj.badge[8].active&&firenotes[num])
					{
						draw_sprite(fireoverlay,0,((-(cbeat-note[num][0])/mspeed)*room_width)+128,32+(note[num][1]*64))
					}
					if(alarm[1]<=0&&menuobj.badge[3].active&&bobnotes[num])
					{
						draw_sprite(boboverlay,0,((-(cbeat-note[num][0])/mspeed)*room_width)+128,32+(note[num][1]*64))
					}
					if(alarm[1]<=0&&menuobj.badge[9].active&&pugnotes[num])
					{
						draw_sprite(pugoverlay,0,((-(cbeat-note[num][0])/mspeed)*room_width)+128,32+(note[num][1]*64))
					}
					if(arlorow==note[num][1]&&menuobj.badge[11].active)
					{
						draw_sprite(arlodinky,0,64,32+(note[num][1]*64))
					}
					draw_line(128-(leniencyl*256),32+((note[num][1])*64),128+(leniencye*256),32+((note[num][1])*64))
				}
			}
		}
		else
		{
			if((((-(cbeat-note[num][0])/mspeed)*room_height)+128)<room_height&&(((-(cbeat-note[num][0])/mspeed)*room_height)+128)>0)
			{
				cares=true
				if(note[num][2]&&menuobj.arrows==0)
				{
					var sizey=(((-(cbeat-note[num][0])/mspeed)*room_height)+128)/128
					if(note[num][1]<2)
					{
						draw_circle(32+(note[num][1]*64)+rowpos[note[num][1]][1],((-(cbeat-note[num][0])/mspeed)*room_width)+128+rowpos[note[num][1]][0],(32+(note[num][1]*3))*sizey,note[num][1])
					}
					else
					{
						draw_rectangle((32-(32*sizey))+128+rowpos[note[num][1]][1],((-(cbeat-note[num][0])/mspeed)*room_width)+128-(32*sizey)+rowpos[note[num][1]][0],(32+(32*sizey))+128+rowpos[note[num][1]][1],((-(cbeat-note[num][0])/mspeed)*room_width)+128+(32*sizey)+rowpos[note[num][1]][0],true)
					}
				}
				if(-(cbeat-note[num][0])<0&&!note[num][3]&&note[num][1]!=3||!menuobj.spdrumroll&&-(cbeat-note[num][0])<0&&!note[num][3])
				{
					notes+=1
					note[num][3]=true
					audio_play_sound(asset_get_index("hit"+string(note[num][1]+1)),1000,false)
				}
				if(!note[num][2])
				{
					if(menuobj.arrows>=1)
					{
						draw_sprite(menuobj.notestyles[menuobj.arrows],note[num][1],32+(note[num][1]*64)+rowpos[note[num][1]][1],((-(cbeat-note[num][0])/mspeed)*room_width)+128+rowpos[note[num][1]][0])
					}
					else
					{
						if(note[num][1]<2)
						{
							draw_circle(32+(note[num][1]*64)+rowpos[note[num][1]][1],((-(cbeat-note[num][0])/mspeed)*room_width)+128+rowpos[note[num][1]][0],32+(note[num][1]*3),note[num][1])
						}
						else if(note[num][1]==3)
						{
							draw_sprite(partialcirc,1,(32*note[num][4])+32+(note[num][1]*64)+rowpos[note[num][1]][1],((-(cbeat-note[num][0])/mspeed)*room_width)+128+rowpos[note[num][1]][0])
						}
						else
						{
							draw_rectangle((0+(note[num][1]*64))+rowpos[note[num][1]][1],(((-(cbeat-note[num][0])/mspeed)*room_width)+128-32)+rowpos[note[num][1]][0],(64+(note[num][1]*64))+rowpos[note[num][1]][1],(((-(cbeat-note[num][0])/mspeed)*room_width)+128+32)+rowpos[note[num][1]][0],true)
						}
					}
					if(menuobj.badge[0].active&&ballcapcanhit)
					{
						draw_sprite(ballcapoverlay,0,32+(note[num][1]*64),((-(cbeat-note[num][0])/mspeed)*room_width)+128)
					}
					if(alarm[1]<=0&&menuobj.badge[8].active&&firenotes[num])
					{
						draw_sprite(fireoverlay,0,32+note[num][1]*64,((-(cbeat-note[num][0])/mspeed)*room_width)+128)
					}
					if(alarm[1]<=0&&menuobj.badge[3].active&&bobnotes[num])
					{
						draw_sprite(boboverlay,0,32+(note[num][1]*64),((-(cbeat-note[num][0])/mspeed)*room_width)+128)
					}
					if(alarm[1]<=0&&menuobj.badge[9].active&&pugnotes[num])
					{
						draw_sprite(pugoverlay,0,32+(note[num][1]*64),((-(cbeat-note[num][0])/mspeed)*room_width)+128)
					}
					if(arlorow==note[num][1]&&menuobj.badge[11].active)
					{
						draw_sprite(arlodinky,0,32+(note[num][1]*64),64)
					}
					draw_line(32+((note[num][1])*64),128-(leniencyl*256),32+((note[num][1])*64),128+(leniencye*256))
				}
			}
		}
				var scorefromhit=105-(100*abs(note[num][0]-cbeat))
				if(cares&&-(cbeat-note[num][0])>-leniencyl&&-(cbeat-note[num][0])<leniencye&&!keyshit[note[num][1]]&&!note[num][2])
				{
					if(note[num][1]<array_length(keyhit)&&keyhit[note[num][1]]||audio_sound_get_pitch(aud)>1&&menuobj.auto&&scorefromhit>=80||menuobj.auto&&scorefromhit>=100||menuobj.badge[0].active&&ballcapcanhit&&-(cbeat-note[num][0])<0||doughits>0&&menuobj.badge[4].active)
					{
						keyshit[note[num][1]]=1
						doughits-=1
						if(menuobj.badge[0].active&&ballcapcanhit&&-(cbeat-note[num][0])<0)
						{
							audio_play_sound(ballcaphitsfx,1000,false)
							ballcaphit=true
						}
						ballcapcanhit=!ballcapcanhit
						if(menuobj.auto)
						{
							ind=note[num][1]+1
							image_index=6
							alarm[0]=32
							alt=!alt
						}
						array_push(accuracy,scorefromhit)
						if(scorefromhit<50)
						{
							rating="offbeat..."
						}
						if(scorefromhit>50)
						{
							rating="decent..."
						}
						if(scorefromhit>80)
						{
							rating="good-"
						}
						if(scorefromhit>90)
						{
							rating="superb!"
						}
						if(scorefromhit>=95)
						{
							rating="amazing!"
						}
						if(scorefromhit>=90&&menuobj.arrows)
						{
							var p=part_system_create(arrowhit)
							if(menuobj.downscroll)
							{
								part_system_position(p,32+(note[num][1]*64)+rowpos[note[num][1]][1],((-(cbeat-note[num][0])/mspeed)*room_width)+128+rowpos[note[num][1]][0])
							}
							else
							{
								part_system_position(p,((-(cbeat-note[num][0])/mspeed)*room_width)+128+rowpos[note[num][1]][0],(note[num][1]*64)+rowpos[note[num][1]][1])
							}
						}
						//rot=choose(22.5,-22.5)
						size=1.5
						if(note[num][1]!=3||!menuobj.spdrumroll)
						{
							nnum=num+1
							hit=true
							note[num][2]=true
						}
						else
						{
							hit=true
							audio_play_sound(asset_get_index("hit"+string(note[num][1]+1)),1000,false)
						}
						if(menuobj.badge[15].active)
						{
							scorefromhit*=combo/20
						}
						scorey+=scorefromhit
						if(menuobj.badge[6].active)
						{
							scorey+=scorefromhit
						}
						if(menuobj.badge[9].active&&pugnotes[num])
						{
							scorey+=(abs(cbeat-note[num][0]))*300
						}
						if(menuobj.badge[10].active)
						{
							scorey+=(abs(cbeat-note[num][0]))*400
						}
						if(menuobj.badge[14].active)
						{
							scorey+=(abs(cbeat-note[num][0]))*900
						}
						am=string(-(oldscore-scorey))
						if(doughits<=0)
						{
							combo+=1+(menuobj.badge[6].active)+(menuobj.badge[8].active&&firenotes[num])
							if(menuobj.badge[8].active&&firenotes[num])
							{
								audio_play_sound(firehit,1000,false)
							}
						}
						if(combo>=100&&menuobj.badge[4].active)
						{
							combo=0
							doughits=100
						}
						keyhit[note[num][1]]=false
					}
				}
		
		num+=1
	}
	if(notes>1)
	{
		
	}


	var num=0
	repeat(array_length(keyhit))
	{
		if(keyhit[num])
		{
			arlorow=num
		}
		if(keyhit[num]&&!hit&&!ballcaphit)
		{
			ghostmisses+=1
			rating="ghost miss..."
			break;
		}
		num+=1
	}
	if(fc&&alarm[3]>0)
	{
		draw_text_ext_transformed((room_width/2),(room_height/2),"FULL COMBOOOOOOO",9999,99999,5,5,irandom_range(-15,15))
	}
	draw_set_halign(fa_center)
	var num=0
	var ecs=(camera_get_view_width(view_camera[0])/4)*3
	var why=room_height/2
	repeat(array_length(menuobj.bassbind))
	{
		var pressing=keyboard_check(menuobj.bassbind[num])
		draw_sprite(basskeyicon,pressing,ecs,why)
		draw_text(ecs+32,why+32,chr(menuobj.bassbind[num]))
		ecs+=64+16
		num+=1
	}
	num=0
	ecs=(camera_get_view_width(view_camera[0])/4)*3
	why+=64+16
	repeat(array_length(menuobj.snarebind))
	{
		var pressing=keyboard_check(menuobj.snarebind[num])
		draw_sprite(cymbalkeyicon,pressing,ecs,why)
		draw_text(ecs+32,why+32,chr(menuobj.snarebind[num]))
		ecs+=64+16
		num+=1
	}
	num=0
	ecs=(camera_get_view_width(view_camera[0])/4)*3
	why+=64+16
	repeat(1)
	{
		var pressing=keyboard_check(menuobj.cymbalbind)
		draw_sprite(drumrollkeyicon,pressing,ecs,why)
		draw_text(ecs+32,why+32,chr(menuobj.cymbalbind))
		ecs+=64+16
		num+=1
	}
	num=0
	ecs=(camera_get_view_width(view_camera[0])/4)*3
	why+=64+16
	repeat(array_length(menuobj.rollbind))
	{
		var pressing=keyboard_check(menuobj.rollbind[num])
		draw_sprite(snarekeyicon,pressing,ecs,why)
		draw_text(ecs+32,why+32,chr(menuobj.rollbind[num]))
		ecs+=64+16
		num+=1
	}
	draw_set_halign(fa_left)
	if(!menuobj.drumsounds)
	{
		audio_stop_sound(hit1)
		audio_stop_sound(hit2)
		audio_stop_sound(hit3)
		audio_stop_sound(hit4)
	}
	mspeed=dmspeed