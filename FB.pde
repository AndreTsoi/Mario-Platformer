class FB extends FGameObject {

  int counter = 0;
  FB(float x, float y) {
    super();
    setPosition(x, y);
    setName("bomb");
    attachImage(bombImg);
    setStatic(false);
    setRotatable(true);
  }

  void act() {
    collision();
    dying();
    counter++;
  }

  void dying() {
    if (counter >= 80) {
      bombs.remove(this);
      world.remove(this);
    }
  }

  void collision() {
    for (int i = 0; i < enemies.size(); i++) {
      FGameObject f = enemies.get(i);
      if (f.getX() > getX() - 50 && f.getX() < getX() + 50 && f.getY() > getY() - 50 && f.getY() < getY() + 50) {
        int dirry = (int) random(1, 2);
        bombs.remove(this);
        world.remove(this);
        if (dirry == 1) {
        f.setVelocity(-1000, -700);
        } else if (dirry == 2) {
          f.setVelocity(1000, -700);
        }

      }
      
    }
  }
}
