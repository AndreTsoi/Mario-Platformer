class Health{
 float x;
 float y;
 boolean gone; 
  int frame = 0;
  Health(int _x, int _y) {
    x = _x;
    y = _y;
    
  }
  
  
  void act() {
    animate();
    
  }
  
  void animate() {
    if (!gone) {
    image(heartred, x, y);
    } else if (gone) {
     image(healthwhite, x, y); 
    }
    //if (frame >= health.length) frame = 0;
    
    
    /*if (frameCount % 5 == 0) {
      if (direction == R) attachImage(goomba[frame]);
      if (direction == L) attachImage(reverseImage(goomba[frame]));
      frame++;*/
    }
  
    
  }
  
  
  
  
  
  
//}
