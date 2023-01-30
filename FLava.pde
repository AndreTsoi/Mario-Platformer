class FLava extends FGameObject {


  int frame = (int) random (1, 5);
  int speed;

  FLava(float x, float y) {
    super();
    setPosition(x, y);
    setName("lava");
    setStatic(true);
  }


  void act() {
    collision();
    animate();
  }

  void collision() {
    if (isTouching("player")) {
           takeDamage();

  
    }
  }

  void animate() {
    if (frame >= lava.length) frame = 0;
    if (frameCount % 20 == 0) {
      attachImage(lava[frame]);
      frame++;
    }
  
  }
}
