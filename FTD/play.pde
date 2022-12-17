void play() {
  //background(galaxy);
  drawMap();
  animateThings();
  drawPlayInterface();
  handleButtonClicks();
  nextWave.show();
  buildButton.show();
}

void drawMap() {
  //green grass
  //fill(green);
  //rect(width/2, height/2, width, height);
  if (map == 1) {
    image(galaxy, 400, 400);
    //path
    stroke(red);
    strokeWeight(30);
    line(0, 400, 200, 400);
    line(200, 400, 200, 200);
    line(200, 200, 400, 200);
    line(400, 200, 400, 600);
    line(400, 600, 300, 600);
    line(300, 600, 300, 500);
    line(300, 500, 500, 500);
    line(500, 500, 500, 400);
    line(500, 400, 800, 400);
    strokeWeight(1);
  }

  if (map == 2) {
    background(pink);
    stroke(orange);
    strokeWeight(42);
    line(0, 400, 400, 400);
    line(400, 400, 400, 200);
    line(400, 200, 600, 200);
    line(600, 200, 600, 350);
    line(600, 350, 1000, 350);
  }

  //temp nodes'
  // int i = 0;
  //while (i < 8) {
  //map1nodes[i].show();
  //i++;

  //side button catalog
  fill(0);
  rect(900, 300, 100, 1000);
  //}
}

void drawPlayInterface() {
  stroke(white);
  fill(black);
  rect(900, height/2, 200, height);

  fill(white);
  textSize(20);
  text("Next Wave: " + waveNumber, 900, 30);
  nextWave.show();

  //lives
  if (map == 1) {
    fill(white);
    textSize(30);
    text("Lives: " + lives, 100, 50);
    text("Money: $" + money, 100, 80);
  }

  if (map == 2) {
    fill(black);
    textSize(30);
    text("Lives: " + lives, 100, 50);
    text("Money: $" + money, 100, 80);
  }
}

void animateThings() {
  //inv++;
  for (int i = 0; i < mobs.size(); i++) {
    Mob myMob = mobs.get(i);
    myMob.show();
    myMob.act();


    if (myMob.x > 850 && inv > 100) {
      background(red);
      lives--;
      inv = 0;
      mobs.remove(i);
    }

    if (lives <= 0) {
      mode = GAMEOVER;
    }

    if (myMob.hp <= 0) {
      mobs.remove(i);
      money += myMob.value;
      i--;
    }
  }

  for (int i = 0; i < towers.size(); i++) {
    Tower myTower = towers.get(i);

    myTower.show();
    if (mobs.size() != 0) {
      myTower.act();
    }
  }
  for (int i = 0; i < bullets.size(); i++) {
    Bullet myBullet = bullets.get(i);
    myBullet.show();
    myBullet.act();
    if (myBullet.hp <=0) {
      bullets.remove(i);
    }
  }
}

void handleButtonClicks() {

  int i = -1;
  int x = 0;
  if (mobs.size()< 1) {
    if (buildButton.clicked) {
      mode = BUILD;
    }
  }
  if (mobs.size() < 1) {
    if ( nextWave.clicked) {
      if (waveNumber % 2 == 0) {
        i = 0;
        x = -50;
        while (i < waveNumber/3) {
          mobs.add(new SpeedyMob(x, 400, 3, 0));
          x = x - 100;
          i++;
        }
      }

      if (waveNumber % 1 == 0) {
        i = -1;
        x = -50;
        while (i< waveNumber) {
          mobs.add(new Mob(x, 400, 3, 0));
          x = x - 50;
          i++;
        }
      }
      if (waveNumber % 3 == 0) {
        i = 0;
        x = -50;
        while (i < waveNumber/3) {
          mobs.add(new ChonkyMob(x, 400, 3, 0));
          x = x-100;
          i++;
        }
      }
      waveNumber++;
    }
  }
}
