class Tower {
  
  //tower modes
  final int PLACING = 0;
  final int PLACED = 1;
  
  //tower data
  float x, y;
  int cooldown, threshold;
  int towerMode;
  int cost;
  int towerType;
  boolean circle;
  int county;
  
  Tower(int type) {
    x = mouseX;
    y = mouseY;
    cooldown = 0;
    circle = false;
    towerMode = PLACING;
    towerType = type;
    if (towerType == GUN) threshold = 30;
    if (towerType == AOE) threshold = 50;
    if (towerType == SNIPER) threshold = 90;
  }
  
  
  void show() {
    
    if (towerMode == PLACING) {
        x = mouseX;
        y = mouseY;
        if (mousePressed && mouseX < 790) {
          towerMode = PLACED;
          //building = false;
      }
    }
    if (towerType == GUN) showGunTower();
    if (towerType == AOE) showAoETower();
    if (towerType == SNIPER) showSniperTower();
}

void  showGunTower() {
  stroke(black);
  strokeWeight(4);
  fill(blue);
  square(x, y, 40);
}

void showAoETower() {
  stroke(black);
  strokeWeight(4);
  fill(pink);
  circle(x, y, 40);
}

void showSniperTower() {
  stroke(black);
  strokeWeight(3);
  fill(purple);
  rect(x, y, 80, 50);
  stroke(white);
  strokeWeight(12);
  
  
  for (int i = 0; i < mobs.size(); i++) {
      Mob myMob = mobs.get(0);
      strokeWeight(map(cooldown, 0, 90, 0, 25));


      if (cooldown > 80) {
        stroke(red);
      }

      line(x, y-30, myMob.x+5, myMob.y+20);
    }

}

void act() {
 if (towerType == GUN) gunTowerAct();
 if (towerType == AOE) aoeTowerAct();
 if (towerType == SNIPER) sniperTowerAct();
}

void gunTowerAct() {
  cooldown++;
 if (cooldown >= threshold) {
   cooldown = 0;
   bullets.add(new Bullet(x, y, 0, -10)); //UP
   bullets.add(new Bullet(x, y, 0, 10)); //DOWN
   bullets.add(new Bullet(x, y, -10, 0)); //LEFT
   bullets.add(new Bullet(x, y, 10, 0)); //RIGHT
 }
}

void aoeTowerAct() {
  if (mode == PLAY) {
      cooldown++;
    } else {
      cooldown = 0;
    }

    if (cooldown > threshold) {
      rings.add(new AoE_Ring(x, y, 200));

      cooldown = 0;
    }

    for (int i = 0; i < rings.size(); i++) {
      county++;
      AoE_Ring myRing = rings.get(i);
      myRing.show();


      if (county == 15) {
        rings.remove(i);
        county = 0;
      }
    }
}

void sniperTowerAct() {
  cooldown++;
    if (cooldown >= threshold) {
      Mob myMob = mobs.get(0);


      myMob.hp-=3;
      cooldown = 0;
    }
}
}
