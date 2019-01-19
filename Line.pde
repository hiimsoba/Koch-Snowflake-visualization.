class Line {
  PVector start;
  PVector end;

  Line(PVector s, PVector e) {
    start = s.copy();
    end = e.copy();
  }

  void render() {
    stroke(255);
    strokeWeight(1);
    line(start.x, start.y, end.x, end.y);
  }

  ArrayList<Line> splitIntoThree() {
    ArrayList<Line> brokenPieces = new ArrayList<Line> ();

    PVector v = PVector.sub(end, start);
    v.div(3);

    PVector a = PVector.sub(end, v);
    PVector b = PVector.add(start, v);

    brokenPieces.add(new Line(start, b));
    brokenPieces.add(new Line(a, end));

    v.rotate(- PI / 3);

    PVector c = PVector.add(b, v);

    brokenPieces.add(new Line(b, c));
    brokenPieces.add(new Line(c, a));

    return brokenPieces;
  }
}
