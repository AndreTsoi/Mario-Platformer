PImage reverseImage( PImage image ) {
  PImage reverse;
  reverse = createImage(image.width, image.height, ARGB );
  for ( int i=0; i < image.width; i++ ) {
    for (int j=0; j < image.height; j++) {
      int xPixel, yPixel;
      xPixel = image.width - 1 - i;
      yPixel = j;
      reverse.pixels[yPixel*image.width+xPixel]=image.pixels[j*image.width+i] ;
    }
  }
  return reverse;
}

void takeDamage() {
  
  player.attachImage(dmg);
  
 for (int  i = 0; i < health.size(); i++) {
  Health h = health.get(i);
  h.gone = true;
 }
 shaking = true;
 shakingTimer = 0;
 ani.show(); 
 if (dyingTimer > 30) {
 dyingTimer = 0;
 }
 
  for (int i = 0; i < health.size(); i++) {
    Health h = health.get(i);
    h.gone = false;
    speed = 300;
  }
  hasBomb = false;
  player.setVelocity(0, 0);
  player.direction = 1;
 
 
}

void click() {
 mouseReleased = false;
 if (mousePressed) wasPressed = true;
 if (wasPressed && !mousePressed) {
  mouseReleased = true;
  wasPressed = false;
   
 }
  
  
  
}
