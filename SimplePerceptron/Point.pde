float f(float x) {
  // y = mx + b
  return -0.5 * x - 0.1;
}

class Point {
  float x;
  float y;
  int label;
  float bias = 1;

  Point() {
    x = random(-1, 1);
    y = random(-1, 1);
    if (y > f(x)) {
      label = 1;
    } else {
      label = -1;
    }
  }

  Point(float x, float y) {
    this.x = x;
    this.y = y;
    if (y > f(x)) {
      label = 1;
    } else {
      label = -1;
    }
  }

  float pixelX() {
    return map(x, -1, 1, 0, width);
  }

  float pixelY() {
    return map(y, -1, 1, height, 0);
  }

  void show() {
    stroke(0);
    if (label == 1) {
      fill(255);
    } else {
      fill(0);
    }
    float px = map(x, -1, 1, 0, width);
    float py = map(y, -1, 1, height, 0);
    ellipse(px, py, 12, 12);
  }
}
