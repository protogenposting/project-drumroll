/// @description Insert description here
// You can write your code in this editor
if(keyboard_check(vk_control))
{
	zselected+=1
	if(zselected>array_length(zooms)-1)
	{
		zselected=array_length(zooms)-1
	}
	stnote=floor(stnote)
}
else if(keyboard_check(vk_shift))
{
	eventsel+=1
	if(eventsel>array_length(eventtypes)-1)
	{
		eventsel=array_length(eventtypes)-1
	}
}
else
{
	stnote-=beatzoom
}
if(pagesel>0&&menuseleted==1)
{
	pagesel-=1
}