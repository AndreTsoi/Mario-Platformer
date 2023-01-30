class FBowser extends FGameObject {


  int direction = L;
  int speed = 100;
  int frame = 0;

  FBowser(float x, float y) {
    super();
    setPosition(x, y);
    setName("bowser");
    setRotatable(false);
  }

  void act() {
    animate();
    collide();
    move();
  }

  void animate() {
    if (frame >= bowserGif.length) frame = 0;
    if (frameCount % 5 == 0) {
      if (direction == R) attachImage(bowserGif[frame]);
      if (direction == L) attachImage(reverseImage(bowserGif[frame]));
      frame++;
    }
  }

  void collide() {
    if (isTouching("wall")) {
      direction *= -1;
      setPosition(getX() + direction, getY());
      speed = 100;
    }
    if (player.getX() < this.getX() && player.getY() >= this.getY()) {
      direction = L;
      speed = 600;
    } else if (player.getX() < this.getX()) {
      speed = 100;
      direction = L;
    } else if (player.getX() > this.getX() && player.getY() >= this.getY()) {
      direction = R;
      speed = 600;
    } else if (player.getX() > this.getX()) {
      speed = 100;
      direction = R;
    }
    if (isTouching("player")) {
      if (player.getY() < getY()-gridSize/2) {
        world.remove(this);
        enemies.remove(this);
        player.setVelocity(player.getVelocityX(), -300);
      } else {
        takeDamage();
      }
    }
  }

  void move() {
    float vy = getVelocityY();
    setVelocity(speed*direction, vy);
  }
}
