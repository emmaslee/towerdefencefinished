void build() {
  drawMap();
  animateThings();
  //flashingSign();
  drawBuildInterface();
  handleBuildClicks();
}

//void flashingSign() {
//  count++;
//  if (count < 20) ;
//  if (count == 40) count = 0;
//}

void drawBuildInterface() {
  stroke(white);
  fill(black);
  rect(900, height/2, 200, height);
  
   //lives
  fill(black);
  textSize(30);
  text("Lives: " + lives, 100, 50);
  text("Money: $" + money, 100, 80);
  fill(blue);
  textSize(60);
  text("BUILD MODE", 450, 100);
  
  playMode.show();
  buyGunTower.show();
  buyAoeTower.show();
  buySniperTower.show();
  

}

void handleBuildClicks() {
  if (playMode.clicked) {
    mode = PLAY;
  }
  if (buyGunTower.clicked && money >= 5) {
    towers.add(new Tower(GUN));
    money -= 5;
  }
  if (buyAoeTower.clicked && money >= 10) {
    towers.add(new Tower(AOE));
    money -= 10;
    }
    if (buySniperTower.clicked && money >= 15) {
    towers.add(new Tower(SNIPER));
    money -= 15;
}
}
