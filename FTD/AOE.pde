class AoE_Ring {
  boolean circle;
  float x, y;
  int d;
  int i;

  AoE_Ring(float _x, float _y, int _d) {
    x = _x;
    y = _y;
    d = _d;
    i = 0;
    circle = false;
  }

  void show() {
    stroke(white);
    fill(green, 20);
    circle(x, y, d);
  }

 
}
