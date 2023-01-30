class FPlate extends FGameObject {
  
  
    FPlate(float x, float y) {
    super();
    setPosition(x, y);
    setName("plate");
    attachImage(plate);
    setStatic(true);
    setRotatable(false);
  }
  
  void act() {
   collision(); 
  }
  
  void collision() {
   if (isTouching("key")) {
    player.setVelocity(player.getVelocityX(), -1350);
    
   }
  }
  
  
}
