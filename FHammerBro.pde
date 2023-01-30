class FHammerBro extends FGameObject {

  int direction = L;
  int frame = 0;
  int speed = 50;
  int counter = 0;
  int threshold = 120;


  FHammerBro(float x, float y) {
    super();
    setPosition(x, y);
    setName("hammerbro");
    setRotatable(false);
  }

  void act() {
    collide();
    move();
    animate();
    hammers();
  }

  void hammers() {


    if (counter >= threshold) {
      FBox b = new FBox(gridSize, gridSize);
      b.setPosition(this.getX(), this.getY());
      b.setVelocity(100, -600);
      b.setAngularVelocity(50);
      b.setSensor(true);
      b.setStatic(false);
      b.setName("hammer");
      b.attachImage(hammer);
      world.add(b);
      println("created");
      
     

      counter = 0;
    }

    counter++;
  }

  void animate() {
    if (frame >= hammerbro.length) frame = 0;
    if (frameCount % 5 == 0) {
      if (direction == R) attachImage(hammerbro[frame]);
      if (direction == L) attachImage(reverseImage(hammerbro[frame]));
      frame++;
    }
  }

  void collide() {
    if (isTouching("wall")) {
      direction *= -1;
      setPosition(getX() + direction, getY());
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
