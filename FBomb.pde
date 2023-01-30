class FBomb extends FGameObject {
  
  
    FBomb(float x, float y) {
    super();
    setPosition(x, y);
    setName("bombPlate");
    attachImage(plate);
    setStatic(true);
    setRotatable(false);
  }
  
  void act() {
   collision(); 
  }
  
  void collision() {
   if (isTouching("player")) {
    hasBomb = true;
    
   }
  }
  
  
}
