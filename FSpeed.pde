class FSpeed extends FGameObject {
  int frame = 0;
  FSpeed(float x, float y) {
    super();
    setPosition(x, y);
    setName("speed");
    setStatic(true);
    setRotatable(false);
  }

  void act() {
    animate();
    collide();
    //move();
  }

  void collide() {
    if (isTouching("player")) {
      speed = 500;
      world.remove(this);
      powerups.remove(this);
      
    }
    
  }


  void animate() {
    if (frame >= star.length) frame = 0;
    if (frameCount % 5 == 0) {
      attachImage(star[frame]);

      frame++;
    }
  }
  
  
}
