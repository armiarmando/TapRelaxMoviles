import 'package:flutter/material.dart';
import 'dart:math';
import 'package:vibration/vibration.dart';
import 'package:tap_relax/src/resources/metodos_circulos.dart';

class Juego3 extends StatefulWidget {
  @override
  _Juego3State createState() => _Juego3State();
}

class _Juego3State extends State<Juego3> {
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(100.0);
  Color _color = Colors.blue[400];
  static const int numeroCirculos = 15;
  static const double radio = 40.0;

  List<Circulo> circulos = [];
  List<Circulo> union = [];
  var i;

  @override
  Widget build(BuildContext context) {
    _creaCirculos(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Juego 3: Une los puntos"),
        centerTitle: true,
      ),
      // body: Column(
      //   children: [for (var c in union) Text(c.toString())],
      // ),
      body: Container(
        height: MediaQuery.of(context).size.height - kToolbarHeight,
        width: MediaQuery.of(context).size.width,
        child: Stack(children: [
          for (Circulo circ in circulos)
            new Positioned(
              left: circ.x,
              top: circ.y,
              child: GestureDetector(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 1),
                  curve: Curves.easeInOutCirc,
                  width: circ.r,
                  height: circ.r,
                  decoration:
                      BoxDecoration(borderRadius: _borderRadius, color: _color),
                ),
                onTap: () {
                  Vibration.vibrate(duration: 150);
                  setState(() {
                    if (union.contains(circ) == false) {
                      union.add(circ);
                    }
                    if (union.length == circulos.length) {
                      circulos.clear();
                      union.clear();
                    }
                  });
                },
              ),
            ),
          new CustomPaint(
            painter: DibujaUnion(union),
          ),
        ]),
      ),
    );
  }

  void _creaCirculos(BuildContext context) {
    while (circulos.length < numeroCirculos) {
      _creaUnCirculo();
    }
  }

  void _creaUnCirculo() {
    double distancia;
    Random random = Random();
    bool empalme;
    double posX, posY;
    double xyInicial = 0;
    double xFinal = MediaQuery.of(context).size.width - radio;
    double yFinal = MediaQuery.of(context).size.height - kToolbarHeight - radio;

    empalme = false;
    posX = random.nextDouble() * (xFinal - xyInicial) + xyInicial;
    posY = random.nextDouble() * (yFinal - xyInicial) + xyInicial;
    Circulo nuevoCirculo = Circulo(posX, posY, radio);

    for (int j = 0; j < circulos.length; j++) {
      distancia = nuevoCirculo.distanciaGaussiana(circulos[j].x, circulos[j].y);
      if (distancia < 2 * radio) {
        empalme = true;
      }
    }

    if (empalme == false) {
      circulos.add(nuevoCirculo);
    }
  }
}

class DibujaUnion extends CustomPainter {
  List<Circulo> circulosUnir;

  DibujaUnion(this.circulosUnir);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue[400]
      ..strokeWidth = 4.0;
    paint.style = PaintingStyle.stroke;
    double radio = this.circulosUnir[0].r * 0.5;

    var path = new Path();

    if (circulosUnir.length > 1) {
      path.moveTo(circulosUnir[0].x + radio, circulosUnir[0].y + radio);
      for (var i = 1; i < circulosUnir.length; i++) {
        path.lineTo(circulosUnir[i].x + radio, circulosUnir[i].y + radio);
      }
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
