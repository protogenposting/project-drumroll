/// @description Insert description here
// You can write your code in this editor
if(keyboard_check(vk_control))
{
	zselected-=1
	if(zselected<0)
	{
		zselected=0
	}
	stnote=floor(stnote)
}
else if(keyboard_check(vk_shift))
{
	eventsel-=1
	if(eventsel<0)
	{
		eventsel=0
	}
}
else
{
	stnote+=beatzoom
}
if(menuseleted==1)
{
	pagesel+=1
}