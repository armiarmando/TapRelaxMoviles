import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tap_relax/src/resources/metodos_circulos.dart';

class Juego1 extends StatefulWidget {
  @override
  _Juego1State createState() => _Juego1State();
}

class _Juego1State extends State<Juego1> {
  List<Circulo> circulos = [];
  List<double> distancias = [];
  List<Color> _color = [];
  List<Circulo> nuevoCirculos = [];
  Random random = Random();
  static const int numeroCirculos = 15;
  static const double radio = 40.0;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(100.0);

  @override
  Widget build(BuildContext context) {
    _creaCirculos(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Juego 1 Desestresol xd xd"),
        centerTitle: true,
      ),
      body: Stack(
        children: _inicioJuego1(context),
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
    Color color;
    double posX, posY;
    double xyInicial = 0;
    double xFinal = MediaQuery.of(context).size.width - radio;
    double yFinal = MediaQuery.of(context).size.height - kToolbarHeight - radio;

    color = Color.fromRGBO(
        random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);

    empalme = false;
    posX = random.nextDouble() * (xFinal - xyInicial) + xyInicial;
    posY = random.nextDouble() * (yFinal - xyInicial) + xyInicial;
    Circulo nuevoCirculo = Circulo(posX, posY, radio);

    for (int j = 0; j < circulos.length; j++) {
      distancia = nuevoCirculo.distanciaGaussiana(circulos[j].x, circulos[j].y);
      if ((distancia < 2 * radio)) {
        empalme = true;
      }
    }

    if (empalme == false) {
      circulos.add(nuevoCirculo);
      distancias.add(distancia);
      _color.add(color);
    }
  }

  List<Widget> _inicioJuego1(BuildContext context) {
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
              duration: Duration(milliseconds: 100),
              curve: Curves.easeInOutCirc,
              width: circulos[i].r,
              height: circulos[i].r,
              decoration:
                  BoxDecoration(borderRadius: _borderRadius, color: _color[i]),
            ),
            onTap: () {
              this.circulos.removeAt(i);
              this._color.removeAt(i);
              this.distancias.removeAt(i);
              setState(() {});
              // _rebentar(context, i);
              // _agregarBurbuja(context);
            }),
      ));
    }

    return _listaCirculosWgt;
  }
}
