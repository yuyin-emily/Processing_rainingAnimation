class rain //object
{
    float x=random(width),
          y=random(-200,0),
          s=random(3,5),
          l=s*10,
          lt=random(100,150);
    
    void run()
    {
      y+=s;
      s+=0.1;
      if(y>height)
      { 
        y=random(-100,0);
        s=random(5,10);
        n++;
        if(n>lt)
        {
          for(int i=0;i<ls.length;i++)
          {
            ls[i].change();
            lswitch[i]=int(random(3))%3!=0;
          }
          n=0;
          lt=random(100,150);
        }
      }
    }
    
    void show()
    {
      stroke(#85C9E3);
      strokeWeight(random(1,3));
      if(mousePressed)
      {
        line(x,y,x+(mouseX-(width/2))*0.1,y+l+(mouseY-(height/2))*0.1);
      }
      else
      {
        line(x,y,x,y+l);
      }
    }
}
