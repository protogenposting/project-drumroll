/// @description Insert description here
// You can write your code in this editor
xptonextlevel=10+((level-1)*4)
if(xp>=xptonextlevel)
{
	level+=1
	xp-=xptonextlevel
}
if(room==menu)
{
	var num=0
	repeat(array_length(badge))
	{
		badge[num].active=false
		if(num+1==badges[0]||num+1==badges[1])
		{
			badge[num].active=true
		}
		num+=1
	}
}