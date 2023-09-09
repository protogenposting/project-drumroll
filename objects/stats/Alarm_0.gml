/// @description Insert description here
// You can write your code in this editor
if(menuobj.badge[3].active&&array_length(bobnotes)<=1)
{
	var num=0
	var beatid=4
	repeat(array_length(note)*4)
	{
		if(num==beatid)
		{
			array_push(bobnotes,true)
			beatid+=4
		}
		else
		{
			array_push(bobnotes,false)
		}
		num+=1
	}
}
if(menuobj.badge[8].active&&array_length(firenotes)<=1)
{
	var num=0
	var beatid=1
	repeat(array_length(note)*4)
	{
		if(num==beatid)
		{
			array_push(firenotes,true)
			beatid+=2
		}
		else
		{
			array_push(firenotes,false)
		}
		num+=1
	}
}
if(menuobj.badge[9].active&&array_length(pugnotes)<=1)
{
	var num=0
	var beatid=0
	repeat(array_length(note)*4)
	{
		if(num==beatid)
		{
			array_push(pugnotes,true)
			beatid+=2
		}
		else
		{
			array_push(pugnotes,false)
		}
		num+=1
	}
}
ind=0
if(menuobj.badge[5].active)
{
	leniency=0.10
}
if(menuobj.badge[16].active)
{
	leniency=0.45
}
if(menuobj.badge[17].active)
{
	shift=-1
}