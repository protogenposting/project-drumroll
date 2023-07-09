/// @description Insert description here
// You can write your code in this editor
if(menuobj.badge[2].active)
{
	misses-=5
	combo+=5
	if(misses<0)
	{
		misses+=1
	}
}
alarm[2]=5*60