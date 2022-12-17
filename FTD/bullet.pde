class Bullet {

  float x, y, vx, vy, d, hp;

  Bullet(float _x, float _y, float _vx, float _vy) {
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
    d = 15;
    hp = 1;
  }

  void show() {
    stroke(black);
    strokeWeight(2);
    fill(blue);
    circle(x, y, d);
  }

  void act() {
    x = x+ vx;
    y = y + vy;
  }
}
