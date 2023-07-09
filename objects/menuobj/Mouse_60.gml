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
else
{
	stnote-=beatzoom
}