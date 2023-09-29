/// @description Insert description here
// You can write your code in this editor

if(hit)
{
	nhit=keyhit
	morehits=true
}
if(menuobj.badge[6].active&&audio_is_playing(song))
{
	if(!menuobj.downscroll)
	{
		var songper=(audio_sound_get_track_position(aud)+menuobj.offset)/audio_sound_length(song)
		var ecs=((room_width-(room_width*songper))+16)+128
		var why=16
		repeat(room_height)
		{
			draw_sprite_ext(nerves,image_index,ecs,why,1,1,0,c_white,1)
			draw_sprite_ext(nervesbottom,image_index,ecs+32,why,room_width/64,1,0,c_white,1)
			why+=64
		}
		ecs+=32
		why=16
	}
	else
	{
		var songper=(audio_sound_get_track_position(aud)+menuobj.offset)/audio_sound_length(song)
		var ecs=16
		var why=((room_height-(room_height*songper))+16)+128
		repeat(room_width)
		{
			draw_sprite_ext(nerves,image_index,ecs,why,1,1,-90,c_white,1)
			draw_sprite_ext(nervesbottom,image_index,ecs+32,why,room_width/64,1,-90,c_white,1)
			ecs+=64
		}
		ecs=16
		why+=32
	}
}