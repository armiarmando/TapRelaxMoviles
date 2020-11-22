import 'dart:math';

class Circulo {
  double x;
  double y;
  double r;
  bool unido = false;

  Circulo(this.x, this.y, this.r);

  double distanciaGaussiana(double xx, double yy) =>
      sqrt((this.x - xx) * (this.x - xx) + (this.y - yy) * (this.y - yy));

  String toString() => "x: " + this.x.toString() + " y: " + this.y.toString();
}
