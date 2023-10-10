// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function number_to_difficulty(int){
	if(int==0)
	{
		return "chill"
	}
	if(int==1)
	{
		return "easy"
	}
	if(int==2)
	{
		return "medium"
	}
	if(int==3)
	{
		return "hard"
	}
	if(int==4)
	{
		return "insanity!"
	}
	if(int==5)
	{
		return "ultra insanity!"
	}
}