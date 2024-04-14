class l
{
  float x=random(width-100),
        y=random(height/2),
        s=random(50,150),
        xc=0;
  
  void change()
  {
    x=random(width-100);
    y=random(height/2);
    s=random(50,150);
  }
  void show(int p)
  {
    if(!rswitch)
    {
      xc=map(x,0,width-100,(width*p/3),(width*(p+1)/3)-100);
      image(img,xc,y,s,s);
    }
  }
}
