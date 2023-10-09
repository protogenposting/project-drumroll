/// @description Insert description here
// You can write your code in this editor


load_story_levels()
refresh_songlist()
menunum[3]=[
	{namey: "left 1: "+chr(menuobj.bassbind[0]),func: function(){
		menuobj.bassbind[0]=keyboard_lastkey
		namey= "bass 1: "+chr(menuobj.bassbind[0])
	}},
	{namey: "left 2: "+chr(menuobj.bassbind[1]),func: function(){
		menuobj.bassbind[1]=keyboard_lastkey
		namey= "bass 2: "+chr(menuobj.bassbind[1])
	}},
	{namey: "left 3: "+chr(menuobj.bassbind[2]),func: function(){
		menuobj.bassbind[2]=keyboard_lastkey
		namey= "bass 3: "+chr(menuobj.bassbind[2])
	}},
	{namey: "middle left 1: "+chr(menuobj.snarebind[0]),func: function(){
		menuobj.snarebind[0]=keyboard_lastkey
		namey= "middle left 1: "+chr(menuobj.snarebind[0])
	}},
	{namey: "middle left 2: "+chr(menuobj.snarebind[1]),func: function(){
		menuobj.snarebind[1]=keyboard_lastkey
		namey= "middle left 2: "+chr(menuobj.snarebind[1])
	}},
	{namey: "middle left 3: "+chr(menuobj.snarebind[2]),func: function(){
		menuobj.snarebind[2]=keyboard_lastkey
		namey= "middle left 3: "+chr(menuobj.snarebind[2])
	}},
	{namey: "middle right: "+chr(menuobj.cymbalbind),func: function(){
		menuobj.cymbalbind=keyboard_lastkey
		namey= "middle right: "+chr(menuobj.cymbalbind)
	}},
	{namey: "right 1: "+chr(menuobj.rollbind[0]),func: function(){
		menuobj.rollbind[0]=keyboard_lastkey
		namey= "right 1: "+chr(menuobj.rollbind[0])
	}},
	{namey: "right 2: "+chr(menuobj.rollbind[1]),func: function(){
		menuobj.rollbind[1]=keyboard_lastkey
		namey= "right 2: "+chr(menuobj.rollbind[1])
	}},
	{namey: "back",func: function(){
		menuobj.menuseleted=0
	}},
]
menutheme=audio_create_stream(songlist[irandom(array_length(songlist)-1)][1])
menunum[5]=[
	{namey: "back",func: function(){
		menuobj.menuseleted=0
	}},
	{namey: "fullscreen",func: function(){
		window_set_fullscreen(!window_get_fullscreen())
	}},
	{namey: "detect offset DO NOT USE YET",func: function(){
		menuobj.offsetaverage=[]
		menuobj.menuseleted=6
	}},
	{namey: "upscroll "+string(menuobj.downscroll),func: function(){
		menuobj.downscroll=!menuobj.downscroll
		namey= "upscroll "+string(menuobj.downscroll)
	}},
	{namey: "note style: "+menuobj.notestylenames[menuobj.arrows],func: function(){
		menuobj.arrows+=1
		if(menuobj.arrows>=array_length(menuobj.notestyles))
		{
			menuobj.arrows=0
		}
		namey= "note style: "+menuobj.notestylenames[menuobj.arrows]
	}},
	{namey: "special drumroll notes "+string(menuobj.spdrumroll),func: function(){
		menuobj.spdrumroll=!menuobj.spdrumroll
		namey= "special drumroll notes "+string(menuobj.spdrumroll)
	}},
	{namey: "drum sounds "+string(menuobj.drumsounds),func: function(){
		menuobj.drumsounds=!menuobj.drumsounds
		namey= "drum sounds "+string(menuobj.drumsounds)
	}},
	{namey: "reset song list",func: function(){
		menuobj.save_story_levels_no_songlist()
		menuobj.shouldsave=false
		game_end()
	}},
	{namey: "reset save data",func: function(){
		file_delete("save.pt")
		menuobj.shouldsave=false
		game_end()
	}},
]