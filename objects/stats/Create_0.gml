/// @description Insert description here
// You can write your code in this editor
fc=true
beat=-1
bpm=87
barper=0
song=Sound1
auto=false
accuracy=[]
function remap(value, left1, right1, left2, right2) {
  return left2 + (value - left1) * (right2 - left2) / (right1 - left1);
}
am=""
misses=0
rating=""
rot=0
size=1
mspeed=5
ind=0
hit=false
sprite=[[idle1,idle1],[hitdrumleft1,hitdrumright1],[hitsnareleft1,hitsnareright1],[hitrimleft1,hitrimright1],[hitdrumleft1,hitdrumright1]]
alt=false
zoom=0
countdown=4
alarm[1]=1
alarm[0]=1
sprnum=0
keyhit=[0,0,0,0]
combo=0
lcombo=0
scorey=0
played=false
audio_stop_all()
ballcapcanhit=false
nnum=0

morehits=false

bobnotes=[]
firenotes=[]
pugnotes=[]

leniency=0.25

doughits=0

accadd=0
shift=0

arlorow=0
rowpos=[[0,0],[0,0],[0,0],[0,0]]
rowsel=0
rowpost=[[0,0],[0,0],[0,0],[0,0]]

keynames=["bass","snare","hat","drumroll"]

keyshit=[0,0,0,0]