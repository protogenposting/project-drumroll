/// @description Insert description here
// You can write your code in this editor
function getnewbeat(n1,n2){
	return n2-n1
}

smenu=0
pagesel=0
global.censored=sprite_add("CENCORED.png",1,false,false,1920/2,1080/2)
alarm[0]=60
randomize()
alt=false
offset=0
song=Sound1
downscroll=false
arrows=5
spdrumroll=true
drumsounds=true

difficulty=0
//add the names of custom note sprites files here
notestyles=[0,arrowsprs,barsprs,drumscolored,arrowsprscolored,barsprscolored]
//add the names of custom note sprites that you want to show up ingame here
notestylenames=["classic drums","arrows","bars","colored drums","colored arrows","colored bars"]

eventsel=0

//add custom event stuff for the editor here
eventtypes=[["zoom bop",["intensity","decrease rate"],[15,1]],["rotate bop",["intensity","direction","decrease rate"],[15,-1,1]],["censor",["time (beats)"],[1]]]
songlist=[["beepsandblips.txt","beepsandblips.ogg",[0,0,0,0,0]],["uranus.txt","protogen posting - uranus.ogg",[0,0,0,0,1]],["spirals.txt","spirals.ogg",[0,0,0,0,1]],["energy island.txt","energy island.ogg",[0,0,0,0,1]],["endless.txt","endless.ogg",[0,0,0,0,2]],["failed experiment.txt","failed experiment.ogg",[0,0,0,0,2]],["weird.txt","weird.ogg",[0,0,0,0,3]],["be cool.txt","be cool.ogg",[0,0,0,0,4]],["polyrights.txt","polyrights.ogg",[0,0,0,0,4]],["inferno.txt","inferno.ogg",[0,0,0,0,4]],["Round5.txt","Round5.ogg",[0,0,0,0,5]],]




nnotes=[]
nevents=[]
events=[]



smenu=0


//default keybinds
bassbind[0]=ord("A")
bassbind[1]=ord("Q")
bassbind[2]=ord("Q")

snarebind[0]=ord("S")
snarebind[1]=ord("Q")
snarebind[2]=ord("Q")

cymbalbind=ord("K")

rollbind[0]=ord("L")
rollbind[1]=ord("Q")

//badges selected by default
badges=[0,0]

badge[0]={
	active: false,
	level: 2,
	sprite: badge1,
	desc: "hits every other note automatically"
}
badge[1]={
	active: false,
	level: 3,
	sprite: badge2,
	desc: "spawns a bonus drumroll every 4 beats"
}
badge[2]={
	active: false,
	level: 4,
	sprite: badge4,
	desc: "absorbs 5 misses every 5 seconds and converts them into combo"
}
badge[3]={
	active: false,
	level: 5,
	sprite: badge3,
	desc: "replaces every 4 notes with a bob note that when missed will not count as a miss"
}
badge[4]={
	active: false,
	level: 8,
	sprite: badge5,
	desc: "every 100 combo, doug plays the next 100 notes for you but steals the combo"
}
badge[5]={
	active: false,
	level: 9,
	sprite: badge7,
	desc: "leniency decreased, only allowing you to get superbs, amazings, and misses"
}
badge[6]={
	active: false,
	level: 10,
	sprite: badge6,
	desc: "nerves slowly crawl accross the screen and block your view, but you get double combo and score"
}
badge[7]={
	active: false,
	level: 15,
	sprite: badge8,
	desc: "your accuracy slowly increases"
}
badge[8]={
	active: false,
	level: 12,
	sprite: badge9,
	desc: "every other note is set ablaze, making them have increased leniency and combo"
}
badge[9]={
	active: false,
	level: 13,
	sprite: badge10,
	desc: "some notes become protected by pugs, giving them more leniency and quadruple score"
}
badge[10]={
	active: false,
	level: 16,
	sprite: badge11,
	desc: "invazion guy speeds up the song by 1.5x, but multiplies your score by 5X"
}
badge[11]={
	active: false,
	level: 17,
	sprite: badge12,
	desc: "arlo blocks the row you hit last from getting any misses"
}
badge[12]={
	active: false,
	level: 20,
	sprite: badge13,
	desc: "causes unimaginable pain..."
}
badge[13]={
	active: false,
	level: 20,
	sprite: badge14,
	desc: "matthew decides you need some more pain... if you lose your full combo, you are immediatly sent back to the menu!"
}
badge[14]={
	active: false,
	level: 25,
	sprite: badge15,
	desc: "bob from bots vs bob speeds up your song by 1.5x, but multiplies your score by 10x (stacks with invazion guy)"
}
badge[15]={
	active: false,
	level: 30,
	sprite: badge16,
	desc: "joseph adds more to your score the more combo you have"
}
badge[16]={
	active: false,
	level: 11,
	sprite: badge18,
	desc: "gives more leniency on all notes"
}
badge[17]={
	active: false,
	level: 10,
	sprite: badge17,
	desc: "shifts all notes up 1 beat"
}
badge[18]={
	active: false,
	level: 35,
	sprite: badge19,
	desc: "turns downscroll on and off every beat"
}
badge[19]={
	active: false,
	level: 37,
	sprite: badge20,
	desc: "makes everything wonky!!1!11"
}
badge[20]={
	active: false,
	level: 40,
	sprite: badge21,
	desc: "changes the move speed of every lane"
}
xp=0

level=1

xptonextlevel=100
menuobj.audtype=[Sound1,""]

function remap(value, left1, right1, left2, right2) {
  return left2 + (value - left1) * (right2 - left2) / (right1 - left1);
}
shouldsave=true
auto=false
cbeat=0
ndist=1
menuseleted=0
dbpm=120
eventy=[]
stnote=0
beatzoom=1
aud=-1
beat=0
zooms=[5,4,3,2,1,0.5,0.33333,0.25,0.125,0.125/2,0.125/3,0.125/4,0.125/5]
zselected=4
al=0
songloaded=""

psize=0
cbpm=120



xpgained=0
function refresh_songlist(){
	menunum[1]=[
		{namey: "back",func: function(){
			menuobj.menuseleted=0
		}},
		{namey: "HP mode: "+string(menuobj.hpmode),func: function(){
		menuobj.hpmode=!menuobj.hpmode
		namey="HP mode: "+string(menuobj.hpmode)
		}},
	]
	var num=0
	repeat(array_length(songlist))
	{
		var sl=[songlist[num][0],songlist[num][1]]
		array_push(menunum[1],{namey: songlist[num][0],nummy: num,sly: sl,func: function(){
			menuobj.load_level_game(sly[0],sly[1],nummy)
		}})
		num+=1
	}
	show_debug_message(songlist)
}
menunum[0]=[
	{namey: "levels",func: function(){
		menuobj.menuseleted=1
		menuobj.refresh_songlist()
	}},
	{namey: "keybinds",func: function(){
		menu.menuseleted=3
	}},
	{namey: "badges",func: function(){
		menu.menuseleted=4
	}},
	{namey: "editor",func: function(){
		menuobj.menuseleted=2
	}},
	{namey: "load level",func: function(){
		with(menuobj)
		{
			var file;
			file = get_open_filename("text file|*.txt", "");
			if file != ""
			{			
				var str1=get_open_filename("audio file|*.ogg", "");
				if(str1!="")
				{
					//file_copy(file,file)
					var nfile = file_copy(file,working_directory+filename_name(file))
					var nstr = file_copy(str1,working_directory+filename_name(str1))
					
					array_push(menuobj.songlist,[filename_name(file),filename_name(str1),[0,0,0,0,load_song_and_bpm(filename_name(file),filename_name(str1))[3]]])
					show_debug_message([working_directory+filename_name(file),working_directory+filename_name(str1),[filename_name(file),filename_name(str1)]])
				}
				else
				{
							
				}
			}
			else
			{
				show_message("no level found lol")
			}
			refresh_songlist()
		}
	}},
	{namey: "settings",func: function(){
		menu.menuseleted=5
	}},
	{namey: "save",func: function(){
		with(menu)
		{
			save_story_levels()
		}
	}},
	{namey: "exit",func: function(){
		game_end()
	}},
]
hpmode=false
menunum[1]=[
	{namey: "back",func: function(){
		menuobj.menuseleted=0
	}},
	{namey: "HP mode: "+string(menuobj.hpmode),func: function(){
		menuobj.hpmode=!menuobj.hpmode
		namey="HP mode: "+string(menuobj.hpmode)
	}},
]
iscopying=false
iscopyingevents=false
pasting=false
menunum[2]=[
	{namey: "change default bpm",func: function(){
		var str1=get_integer("default bpm",menuobj.dbpm)
		if(str1!="")
		{
			menuobj.dbpm=str1
		}
	}},
	{namey: "change difficulty",func: function(){
		var str1=get_integer("difficulty (0-5)",menuobj.difficulty)
		if(str1!="")
		{
			menuobj.difficulty=floor(str1)
			if(menuobj.difficulty>5)
			{
				menuobj.difficulty=5
			}
		}
	}},
	{namey: "import song",func: function(){
		var str1=get_open_filename("audio file|*.ogg", "");
		if(str1!="")
		{
			menuobj.audtype=[audio_create_stream(str1),str1]
		}
	}},
	{namey: "play song",func: function(){
		audio_stop_all()
		with(menuobj)
		{
			reset_hit()
		}
		menuobj.aud=audio_play_sound(menuobj.audtype[0],1000,false)
		audio_sound_set_track_position(menuobj.aud,menuobj.stnote*(60/menuobj.dbpm))
	}},
	{namey: "stop song",func: function(){
		with(menuobj)
		{
			reset_hit()
		}
		audio_stop_all()
		aud=-1
	}},
	{namey: "export",func: function(){
		with(menuobj)
		{
			reset_hit()
			save_level()
		}
	}},
	{namey: "import",func: function(){
		with(menuobj)
		{
			load_level()
		}
	}},
	{namey: "playtest",func: function(){
		with(menuobj)
		{
			var sav=save_level()
			load_level_game(sav,audtype[1])
		}
	}},
	{namey: "copy notes",func: function(){
		with(menuobj)
		{
			nnotes=[stnote]
			iscopying=true
			nevents=[stnote]
			iscopyingevents=true
		}
	}},
	{namey: "paste notes",func: function(){
		with(menuobj)
		{
			pasting=true
			iscopying=false
			iscopyingevents=false
		}
	}},
	{namey: "back",func: function(){
		with(menuobj)
		{
			menuseleted=0
		}
	}},
]
menunum[3]=[
	{namey: "left 1: "+chr(menuobj.bassbind[0]),func: function(){
		menuobj.bassbind[0]=keyboard_lastkey
		namey= "left 1: "+chr(menuobj.bassbind[0])
	}},
	{namey: "left 2: "+chr(menuobj.bassbind[1]),func: function(){
		menuobj.bassbind[1]=keyboard_lastkey
		namey= "left 2: "+chr(menuobj.bassbind[1])
	}},
	{namey: "left 3: "+chr(menuobj.bassbind[2]),func: function(){
		menuobj.bassbind[2]=keyboard_lastkey
		namey= "left 3: "+chr(menuobj.bassbind[2])
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
menunum[4]=[
	{namey: "back",func: function(){
		menuobj.menuseleted=0
	}},
]

menunum[6]=[
	{namey: "back",func: function(){
		var num=0
		var nummy=0
		repeat(array_length(menuobj.offsetaverage))
		{
			nummy+=menuobj.offsetaverage[num]
			num+=1
		}
		nummy/=num
		menuobj.offset=nummy
		menuobj.menuseleted=0
		room_speed=60
	}},
]
save_level=function(){
	//make epoc array
	reset_hit()
	var _saveData = {
		eventy:menuobj.eventy,
		dbpm:menuobj.dbpm,
		events: menuobj.events,
		difficulty: menuobj.difficulty
	}
	
	var _string = json_stringify(_saveData)
	_string = base64_encode(_string)
	var _buffer = buffer_create(string_byte_length(_string)+1, buffer_fixed,1)
	buffer_write(_buffer, buffer_string,_string)
	show_debug_message("game saved! "+_string)
	var file;
	file = get_save_filename(".txt", "level");
	if file != ""
	{
	   buffer_save(_buffer,file)
	}
	buffer_delete(_buffer)
	return file;
}
	
	reset_hit=function(){
		var num=0
		repeat(array_length(eventy))
		{
			eventy[num][2]=false
			eventy[num][3]=false
			num+=1
		}
		
	}
	load_level=function(){
		var file;
		file = get_open_filename("text file|*.txt", "");
		if file != ""
		{
			var _buffer = buffer_load(file)
			
			var _string = buffer_read(_buffer,buffer_string)
			buffer_delete(_buffer)
			_string = base64_decode(_string)
			var _loadData = json_parse(_string)
			show_debug_message("game LOADED DIAPER! "+string(_loadData))
			menuobj.eventy=_loadData.eventy
			reset_hit()
			menuobj.dbpm=_loadData.dbpm
			if(variable_struct_exists(_loadData,"events"))
			{
				menuobj.events=_loadData.events
			}
			if(variable_struct_exists(_loadData,"difficulty"))
			{
				menuobj.difficulty=_loadData.difficulty
			}
		}
		else
		{
			show_message("no level found lol")
		}
	}
	
	load_level_game=function(level,song,songid){
		var file;
		if(level=="")
		{
			file = get_open_filename("text file|*.txt", "");
		}
		else
		{
			file = level
		}
		if file != ""
		{
			var _buffer = buffer_load(file)
			
			var _string = buffer_read(_buffer,buffer_string)
			buffer_delete(_buffer)
			_string = base64_decode(_string)
			var _loadData = json_parse(_string)
			show_debug_message("game LOADED DIAPER! "+string(_loadData))
			inst=instance_create_depth(x,y,-100,stats)
			inst.note=_loadData.eventy
			inst.bpm=_loadData.dbpm
			inst.sid=songid
			if(variable_struct_exists(_loadData,"events"))
			{
				inst.events=_loadData.events
			}
			array_sort(inst.note,sort_by_beat)
			if(song!="")
			{
				var str1=song
			}
			else
			{
				var str1=get_open_filename("audio file|*.ogg", "");
			}
			if(str1!="")
			{
				inst.song=audio_create_stream(str1)
				room_goto(Room1)
			}
			else
			{
				instance_destroy(inst)			
			}
		}
		else
		{
			show_message("no level found lol")
		}
	}
	load_song_and_bpm=function(level,song){
		var file;
		if(level=="")
		{
			file = get_open_filename("text file|*.txt", "");
		}
		else
		{
			file = level
		}
		if file != ""
		{
			var _buffer = buffer_load(file)
			
			var _string = buffer_read(_buffer,buffer_string)
			buffer_delete(_buffer)
			_string = base64_decode(_string)
			var _loadData = json_parse(_string)
			//show_debug_message("game LOADED DIAPER! "+string(_loadData))
			var bpmy=_loadData.dbpm
			var diff=0
			if(variable_struct_exists(_loadData,"difficulty"))
			{
				diff=_loadData.difficulty
			}
			else
			{
				diff=floor(bpmy/60)
				if(diff>5)
				{
					diff=5
				}
			}
			if(song!="")
			{
				var str1=song
			}
			else
			{
				var str1=get_open_filename("audio file|*.ogg", "");
			}
			if(str1!="")
			{
				var songy=audio_create_stream(str1)
				show_debug_message([bpmy,songy,str1,diff])
				return[bpmy,songy,str1,diff]
			}
		}
		else
		{
			return false
		}
	}
save_story_levels=function(){
	var num=0
	var array=[]
	/*repeat(array_length(storylevel))
	{
		array_push(array,storylevel[num].unlocked)
		num+=1
	}*/
	var struct={
		savedbinds: [menuobj.bassbind,menuobj.snarebind,menuobj.cymbalbind,menuobj.rollbind],
		levellist: menuobj.songlist,
		level: menuobj.level,
		nxp: menuobj.xptonextlevel,
		xp: menuobj.xp,
		latency: menuobj.offset,
		downscroll: menuobj.downscroll,
		arrows: menuobj.arrows,
		drumsounds: menuobj.drumsounds,
		spdrumroll: menuobj.spdrumroll,
		badges: menuobj.badges
	}
	save_file(struct,"save.pt")
}
save_story_levels_no_songlist=function(){
	var num=0
	var array=[]
	/*repeat(array_length(storylevel))
	{
		array_push(array,storylevel[num].unlocked)
		num+=1
	}*/
	var struct={
		savedbinds: [menuobj.bassbind,menuobj.snarebind,menuobj.cymbalbind,menuobj.rollbind],
		level: menuobj.level,
		nxp: menuobj.xptonextlevel,
		xp: menuobj.xp,
		latency: menuobj.offset,
		downscroll: menuobj.downscroll,
		arrows: menuobj.arrows,
		drumsounds: menuobj.drumsounds,
		spdrumroll: menuobj.spdrumroll
	}
	save_file(struct,"save.pt")
}
load_story_levels=function(){
	var str=load_file("save.pt")
	if(str!=false)
	{
		menuobj.bassbind=str.savedbinds[0]
		menuobj.snarebind=str.savedbinds[1]
		menuobj.cymbalbind=str.savedbinds[2]
		menuobj.rollbind=str.savedbinds[3]
		if(variable_struct_exists(str,"levellist"))
		{
			menuobj.songlist=str.levellist
		}
		if(variable_struct_exists(str,"level"))
		{
			menuobj.level=str.level
		}
		if(variable_struct_exists(str,"nxp"))
		{
			menuobj.xptonextlevel=str.nxp
		}
		if(variable_struct_exists(str,"xp"))
		{
			menuobj.xp=str.xp
		}
		if(variable_struct_exists(str,"latency"))
		{
			menuobj.offset=str.latency
		}
		if(variable_struct_exists(str,"downscroll"))
		{
			menuobj.downscroll=str.downscroll
		}
		if(variable_struct_exists(str,"arrows"))
		{
			menuobj.arrows=str.arrows
		}
		if(variable_struct_exists(str,"drumsounds"))
		{
			menuobj.drumsounds=str.drumsounds
		}
		if(variable_struct_exists(str,"spdrumroll"))
		{
			menuobj.spdrumroll=str.spdrumroll
		}
		if(variable_struct_exists(str,"badges"))
		{
			menuobj.badges=str.badges
		}
		/*var num=0
		repeat(array_length(str.savedlevels))
		{
			storylevel[num].unlocked=str.savedlevels[0]
			num+=1
		}*/
	}
	else
	{
		save_story_levels()
	}
}