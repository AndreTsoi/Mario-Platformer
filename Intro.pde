void Intro() {
 background(white); 
 
 introButton.show();
 textSize(60);
 fill(black);
 text("Ultimate", 310, 200);
 text("Platformer", 310, 260);
 
 if (introButton.clicked) {
  mode = GAME; 
 }
 
  
}
