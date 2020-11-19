import 'dart:math';

import 'package:flutter/material.dart';

class Juego1 extends StatefulWidget {
  @override
  _Juego1State createState() => _Juego1State();
}

class _Juego1State extends State<Juego1> {
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.blue[400];
  Random random = Random();
  // double _tap = random.nextInt(300).toDouble();

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(100.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            _inicioJuego1(),
            _inicioJuego1(),
            _inicioJuego1(),
            _inicioJuego1(),
            _inicioJuego1(),
            _inicioJuego1(),
            _inicioJuego1(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }));
  }

  Widget _inicioJuego1() {
    Random random = new Random();
    double _random1 = random.nextDouble();
    double _random2 = random.nextDouble();
    bool variable1 = random.nextBool();
    bool variable2 = random.nextBool();

    (variable1 == true)
        ? (_random1 = _random1 * 1)
        : (_random1 = _random1 * -1);
    (variable2 == true)
        ? (_random2 = _random2 * 1)
        : (_random2 = _random2 * -1);
    return GestureDetector(
      child: Container(
        child: Align(
          alignment: Alignment(_random1, _random2),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 1000),
            curve: Curves.easeInOutCirc,
            width: _width,
            height: _height,
            decoration:
                BoxDecoration(borderRadius: _borderRadius, color: _color),
          ),
        ),
      ),
      onTap: () {
        _reventarBurbuja();
        _burbujaNueva();
      },
    );
  }

  void _reventarBurbuja() {
    setState(() {
      _width = 0.0;
      _height = 0.0;
      // _borderRadius = BorderRadius.circular(100.0);
      print("Accede al metodo");
    });
  }

  void _burbujaNueva() {
    _width = 50.0;
    _height = 50.0;
    _inicioJuego1();
  }
}
