class FPlayer extends FGameObject {

  int frame;
  int direction;
  int lives = 3;
  
  FPlayer() {
    super();
    direction = R;
    setPosition(380, 150);
    setFillColor(black);
    setName("player");
    setRotatable(false);
  }


  void act() {
    handleInput();
    collisions();
    animate();
  }

  void animate() {
    if (frame >= action.length) frame = 0;
    if (frameCount % 5 == 0) {
      
      if (direction == R) attachImage(action[frame]);
      if (direction == L) attachImage(reverseImage(action[frame]));
      frame++;
    }
  }


  void handleInput() {

    float vx = getVelocityX();
    float vy = getVelocityY();
    if (abs(vy) < 0.1) {
      action = idle;
    }

    if (akey) {
      setVelocity(-1*speed, vy);
      action = run;
      direction = L;
    }
    if (dkey) { 
      setVelocity(speed, vy);
      action = run;
      direction = R;
    }
    if (hitGroundPlayer()) {
      if (spacekey){
        setVelocity(vx, -300);
      }
    }
    if (abs(vy) > 0.1) {
     action = jump;
    
    }
  }

  void collisions() {
    if (isTouching("spike") || isTouching("hammer")) {
      takeDamage();

      
    }
  }
}
