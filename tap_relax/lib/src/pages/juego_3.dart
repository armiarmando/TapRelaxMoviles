import 'package:flutter/material.dart';
import 'package:tap_relax/src/resources/metodos_circulos.dart';
import 'dart:math';
import 'package:vibration/vibration.dart';

class Juego3 extends StatefulWidget {
  @override
  _Juego3State createState() => _Juego3State();
}

class _Juego3State extends State<Juego3> {
  List<Circulo> circulos = [];
  List<double> distancias = [];
  List<Circulo> union = [];
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(100.0);
  Color _color = Colors.tealAccent[400];
  static const int numeroCirculos = 15;
  static const double radio = 40.0;

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
      body: Stack(
        children: _inicioJuego3(context),
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
      distancias.add(distancia);
    }
  }

  List<Widget> _inicioJuego3(BuildContext context) {
    List<Widget> _listaCirculosWgt = [];
    Orientation orientation = MediaQuery.of(context).orientation;

    for (int i = 0; i < circulos.length; i++) {
      _listaCirculosWgt.add(Positioned(
        left: (orientation == Orientation.portrait)
            ? circulos[i].x
            : circulos[i].y,
        top: (orientation == Orientation.portrait)
            ? circulos[i].y
            : circulos[i].x,
        child: GestureDetector(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 1),
            curve: Curves.easeInOutCirc,
            width: circulos[i].r,
            height: circulos[i].r,
            decoration:
                BoxDecoration(borderRadius: _borderRadius, color: _color),
          ),
          onTap: () {
            if (this.circulos[i].unido == false) {
              Vibration.vibrate(duration: 50);
              if (union.length < 2) {
                union.add(this.circulos[i]);
              }
              linea();
            }
          },
        ),
      ));
    }

    return _listaCirculosWgt;
  }

  void linea() {}
}
