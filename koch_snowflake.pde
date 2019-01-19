ArrayList<Line> snowflake;

void setup() {
  size(600, 600);
  snowflake = new ArrayList<Line> ();
  PVector a = new PVector(0, 50);
  PVector b = new PVector(300, 50);
  PVector c = new PVector(150, 300);
  snowflake.add(new Line(a, b));
  snowflake.add(new Line(b, c));
  snowflake.add(new Line(c, a));
}

void draw() {
  translate(width / 4, height / 4);
  background(0);
  for (Line l : snowflake) {
    l.render();
  }
}

void mousePressed() {
  ArrayList<Line> newSegments = new ArrayList<Line> ();
  for (int i = snowflake.size() - 1; i >= 0; i--) {
    newSegments.addAll(snowflake.get(i).splitIntoThree());
    snowflake.remove(i);
  }
  snowflake.addAll(newSegments);
}
