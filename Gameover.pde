void Gameover() {
  background(red);
  fill(black);
  textSize(65);

  text("You died", 290, 260);
  gameoverButton.show();
  if (gameoverButton.clicked) {
    mode = INTRO;
   
  }
}
