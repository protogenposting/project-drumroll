/// @description Insert description here
// You can write your code in this editor
var num=sprnum
repeat(2)
{
	ind=sprnum
	alarm[0]=32
	num+=1
}
sprnum+=1
audio_play_sound(asset_get_index("hit"+string(countdown)),1000,false)
countdown-=1
if(sprnum<array_length(sprite))
{
	alarm[1]=(60/bpm)*64
}
else if(menuobj.badge[1].active)
{
	var beatid=4
	repeat(100)
	{
		array_push(note,[beatid,3,false,false,1])
		beatid+=4
	}
}
alarm[2]=5*60