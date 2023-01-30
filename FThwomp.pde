class FThwomp extends FGameObject {

  int direction = L;
  boolean angry = false;
  boolean fallen = false;
  int speed = 50;
  int frame = 0;

  FThwomp(float x, float y) {
    super();
    setPosition(x, y);
    setName("thwomp");
    setStatic(true);
    setRotatable(false);
  }

  void act() {
    animate();
    collide();
    move();
  }

  void animate() {
    if (!angry) attachImage(thwomp0);
    if (angry) {
      fallen = true;
      attachImage(thwomp1);
      setStatic(false);
    }
     if (angry && hitGroundThwomp(this)) {
       angry = false;
       setStatic(true);
      }
    
    
  }

  void collide() {
    if (isTouching("player") && angry ) {
         takeDamage();

      }
      
     
  }

  void move() {
    if (player.getX() > getX() - gridSize && !fallen) {
      angry = true;
    }
  }
}
