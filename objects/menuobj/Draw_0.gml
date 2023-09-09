/// @description Insert description here
// You can write your code in this editor
if(cbpm!=0&&room!=Room1)
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
	draw_sprite(sprite_index,image_index,room_width/2,room_height/2)
}