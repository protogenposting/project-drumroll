/// @description Insert description here
// You can write your code in this editor


load_story_levels()
refresh_songlist()
menunum[3]=[
	{namey: "bass 1: "+chr(menuobj.bassbind[0]),func: function(){
		menuobj.bassbind[0]=keyboard_lastkey
		namey= "bass 1: "+chr(menuobj.bassbind[0])
	}},
	{namey: "bass 2: "+chr(menuobj.bassbind[1]),func: function(){
		menuobj.bassbind[1]=keyboard_lastkey
		namey= "bass 2: "+chr(menuobj.bassbind[1])
	}},
	{namey: "bass 3: "+chr(menuobj.bassbind[2]),func: function(){
		menuobj.bassbind[2]=keyboard_lastkey
		namey= "bass 3: "+chr(menuobj.bassbind[2])
	}},
	{namey: "snare 1: "+chr(menuobj.snarebind[0]),func: function(){
		menuobj.snarebind[0]=keyboard_lastkey
		namey= "snare 1: "+chr(menuobj.snarebind[0])
	}},
	{namey: "snare 2: "+chr(menuobj.snarebind[1]),func: function(){
		menuobj.snarebind[1]=keyboard_lastkey
		namey= "snare 2: "+chr(menuobj.snarebind[1])
	}},
	{namey: "snare 3: "+chr(menuobj.snarebind[2]),func: function(){
		menuobj.snarebind[2]=keyboard_lastkey
		namey= "snare 3: "+chr(menuobj.snarebind[2])
	}},
	{namey: "cymbal: "+chr(menuobj.cymbalbind),func: function(){
		menuobj.cymbalbind=keyboard_lastkey
		namey= "cymbal 1: "+chr(menuobj.cymbalbind)
	}},
	{namey: "drumroll 1: "+chr(menuobj.rollbind[0]),func: function(){
		menuobj.rollbind[0]=keyboard_lastkey
		namey= "drumroll 1: "+chr(menuobj.rollbind[0])
	}},
	{namey: "drumroll 2: "+chr(menuobj.rollbind[1]),func: function(){
		menuobj.rollbind[1]=keyboard_lastkey
		namey= "drumroll 2: "+chr(menuobj.rollbind[1])
	}},
	{namey: "back",func: function(){
		menuobj.menuseleted=0
	}},
]
menutheme=audio_create_stream(songlist[irandom(array_length(songlist)-1)][1])