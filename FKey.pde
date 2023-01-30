class FKey extends FGameObject{
 
    FKey(float x, float y) {
    super();
    setPosition(x, y);
    setName("key");
    attachImage(keyy);
    setStatic(false);
    setRotatable(false);
  }
  
  
  void act() {
   collision(); 
  }
 
 void collision() {
  if (isTouching("plate")) {
    keys.remove(this);
    world.remove(this);
  }
 }
  
  
  
  
}
