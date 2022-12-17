class Mob {
  float x, y, vx, vy, d;
  float hp, maxhp;
  int value;
  float speed;
  color fillColor, strokeColor;


  Mob (float _x, float _y, float _vx, float _vy) {
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
    d = 40;
    maxhp = 3 + waveNumber/2;
    value = 1;
    hp = maxhp;
    fillColor = purple;
    strokeColor = pink;
    speed = 1;
  }

  void show() {
    stroke(strokeColor);
    fill(fillColor);
    strokeWeight(3);
    circle(x, y, d);
    healthbar();
  }
  void healthbar() {
    rectMode(CORNER);
    noStroke();
    fill(black);
    rect(x-27, y-(d+5)-2, 54, 14);//background
    fill(pink);
    rect(x-25, y-(d+5), 50, 10);
    fill(green);
    rect(x-25, y-(d+5), hp*50/maxhp, 10);
    rectMode(CENTER);
  }

  void act() {
    x = x + vx*speed;
    y = y + vy*speed;
    //checkForNodes();

    int i = 0;
    while (i < nodes.length) {
      if (dist(nodes[i].x, nodes[i].y, x, y) < 4) {
        vx = nodes[i].dx;
        vy = nodes[i].dy;
      }
      i++;
    }

    i = 0;
    while (i < bullets.size()) {
      Bullet myBullet = bullets.get(i);
      if ( dist(myBullet.x, myBullet.y, x, y) < d/2 + myBullet.d/2) {
        hp = hp -1;
        myBullet.hp = myBullet.hp - 1;
      }
      i++;
    }
    for (int j = 0; j < rings.size(); j++) {
      AoE_Ring myRing = rings.get(j);
      if (dist(myRing.x, myRing.y, x, y) < d/2 + myRing.d/2) {
        hp-=0.08;
      }
    }

  }
}
