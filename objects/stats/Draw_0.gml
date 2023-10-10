/// @description Insert description here
// You can write your code in this editor
image_speed=bpm/120
draw_sprite_ext(sprite[ind][alt],image_index,room_width/2,room_height/2,hp/mhp,hp/mhp,0,c_white,hp/mhp)
if(doughits>0)
{
	draw_sprite(dougdance,image_index,room_width/2,room_height/2)
}
if(countdown<=0&&doughits<=0)
{
	var acc=0
	var num=0
	repeat(array_length(accuracy))
	{
		acc+=accuracy[num]
		num+=1
	}
	acc/=array_length(accuracy)
	acc+=accadd
	draw_set_font(Font1)
	draw_text(room_width/2,(room_height/2) + 128,string(acc)+"%")
	draw_text((room_width/2)-512,(room_height/2) + 256,"misses "+string(misses))
	draw_text((room_width/2)-512,(room_height/2) + 256+64,"ghost misses "+string(ghostmisses))
	if(size>1)
	{
		size-=bpm/2400
		if(size<1)
		{
			size=1
		}
	}
	if(abs(rot)>0)
	{
		rot-=sign(rot)
	}
	draw_set_halign(fa_center)
	draw_text_ext_transformed((room_width/2)-512,(room_height/2)-128,rating,9999,99999,size,size,rot)
	draw_text_ext_transformed((room_width/2)-512,(room_height/2)+128,"score: "+string(scorey),9999,99999,size,size,-rot)
	draw_text_ext_transformed((room_width/2)-512,(room_height/2),"combo: "+string(combo),9999,99999,size,size,-rot)
	if(menuobj.auto)
	{
		draw_text_ext_transformed((room_width/2),(room_height/2)+256,"botplay",9999,99999,size,size,0)
	}
}
else if(doughits>0)
{
	var acc=0
	var num=0
	repeat(array_length(accuracy))
	{
		acc+=accuracy[num]
		num+=1
	}
	acc/=array_length(accuracy)
	acc+=accadd
	draw_set_font(Font1)
	draw_text(room_width/2,(room_height/2) + 128,string(acc)+"%")
	draw_text((room_width/2)-512,(room_height/2) + 256,"misses "+string(misses))
	draw_text((room_width/2)-512,(room_height/2) + 256+64,"ghost misses "+string(ghostmisses))
	if(size>1)
	{
		size-=bpm/2400
		if(size<1)
		{
			size=1
		}
	}
	if(abs(rot)>0)
	{
		rot-=sign(rot)
	}
	draw_set_halign(fa_center)
	draw_text_ext_transformed((room_width/2)-512,(room_height/2)-128,"dougplay ("+string(doughits)+")",9999,99999,size,size,rot)
	draw_text_ext_transformed((room_width/2)-512,(room_height/2)+128,"score: "+string(scorey),9999,99999,size,size,-rot)
	draw_text_ext_transformed((room_width/2)-512,(room_height/2),"combo: "+string(combo),9999,99999,size,size,-rot)
}
else
{
	draw_set_halign(fa_center)
	draw_text_ext_transformed((room_width/2),(room_height/2)+256,string(countdown),9999,99999,5,5,rot)
}