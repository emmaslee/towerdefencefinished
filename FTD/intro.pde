void intro() {
  fill(0);
  textSize(90);
  text("TOWER DEFENSE", 500, 300);
  //introAnimation.show();
  start.show();
  if (start.clicked) {
    mode = MAPSELECT;
  }
}
