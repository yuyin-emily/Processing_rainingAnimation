import ddf.minim.*;

int n=0,wh=height,cordon=150;
float ws=0.001;
PImage img,bg,rainbow;
Minim v;
AudioPlayer player;
rain[] rains = new rain[125]; //use class
l[] ls = new l[3];
boolean rswitch=false;
boolean[] lswitch = new boolean[3];

void setup()
{
    size(600,400);
    img=loadImage("lightning.png");
    bg=loadImage("bg.png");
    rainbow=loadImage("rainbow.png");
    v = new Minim(this);
    player = v.loadFile("sound.mp3");
    for(int i=0;i<rains.length;i++)
    {
      rains[i] = new rain();
    }
    for(int i=0;i<ls.length;i++)
    {
      ls[i] = new l();
      lswitch[i] = true;
    }
    player.play();
}

void draw() //loop
{
  if(!player.isPlaying())
  {
    player.rewind();
    player.play();
  }
  background(#CFECF7);
  image(bg,50,210,500,250);
  for(int i=0;i<ls.length;i++)
  {
    
    if(lswitch[i])
    {
      ls[i].show(i);  
    }
  }
  
  fill(#85C9E3);
  if(!rswitch)
  {
    for(int i=0;i<rains.length;i++)
    {
      rains[i].run();
      rains[i].show();  
    }
    rect(0,wh,width,cordon);
  }
  else
  {
    imageMode(CENTER);
    tint(255,75);
    image(rainbow,width/2,height/4*3,300,300);
    imageMode(CORNER);
    tint(255,255);
    image(bg,50,210,500,250);
  }
  wh-=ws;
  if(wh<(height-cordon))
  {
    wh=height;
    rswitch=int(random(5))%5==0;
    if(rswitch)
    {
      ws=0.002;
    }
    else
    {
      ws=0.001;
    }
  }
}
