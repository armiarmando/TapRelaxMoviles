import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

class Juego1 extends StatefulWidget {
  @override
  _Juego1State createState() => _Juego1State();
}

class _Juego1State extends State<Juego1> {
  double _width = 40.0;
  double _height = 40.0;
  Color _color = Colors.blue[400];
  Random random = Random();
  List<double> burbujasX = new List(10);
  List<double> burbujasY = new List(10);

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(100.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            _inicioJuego1(),

            // _inicioJuego2(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }));
  }

  Widget _inicioJuego1() {
    _width = 40.0;
    _height = 40.0;
    _posiciones();
    for (var i = 0; i < burbujasX.length; i++) {
      return GestureDetector(
        child: Container(
          child: Align(
            alignment: Alignment(burbujasX[i], burbujasY[i]),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 1),
              curve: Curves.easeInOutCirc,
              width: _width,
              height: _height,
              decoration:
                  BoxDecoration(borderRadius: _borderRadius, color: _color),
            ),
          ),
        ),
        onTap: () {
          _inicioJuego1();
          setState(() {});
          // _width = 0.0;
          // _height = 0.0;
          _color = Color.fromRGBO(
              random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
        },
      );
    }
  }

  void _posiciones() {
    bool _variable;
    double _random;

    for (var i = 0; i < burbujasX.length; i++) {
      _variable = random.nextBool();
      _random = random.nextDouble();
      (_variable == true)
          ? (burbujasX[i] = _random * 1)
          : (burbujasX[i] = _random * -1);
    }
    for (var i = 0; i < burbujasY.length; i++) {
      _variable = random.nextBool();
      _random = random.nextDouble();
      (_variable == true)
          ? (burbujasY[i] = _random * 1)
          : (burbujasY[i] = _random * -1);
    }
    for (var i = 0; i < burbujasX.length; i++) {
      print("Soy burbuja X en la posicion [$i]: ${burbujasX[i]}");
      print("Soy burbuja Y en la posicion [$i]: ${burbujasY[i]}");
    }
  }
}
