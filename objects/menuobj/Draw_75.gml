/// @description Insert description here
// You can write your code in this editor

if(showFps)
{
	draw_text(room_width-array_length(fpschart),16,string(fps))
	array_delete(fpschart,0,1)
	array_push(fpschart,fps)
	var ecs=room_width-array_length(fpschart)
	for(var i=0;i<array_length(fpschart)-1;i++)
	{
		draw_line(ecs,fpschart[i],ecs+1,fpschart[i+1])
		ecs++
	}
}