import 'dart:math';

import 'package:flutter/material.dart';

class Juego2 extends StatefulWidget {
  @override
  _Juego2State createState() => _Juego2State();
}

class _Juego2State extends State<Juego2> {
  double _width = 40.0;
  double _height = 40.0;
  Color _color = Colors.blue[400];
  Random random = Random();

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(200.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
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
    return GestureDetector(
      child: Container(
        child: Align(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 1000),
            width: _width,
            height: _height,
            decoration:
                BoxDecoration(borderRadius: _borderRadius, color: _color),
          ),
        ),
      ),
      onTapDown: (TapDownDetails variable) {
        _width = _width * 1.1;
        _height = _height * 1.1;
        setState(() {});
      },
    );
  }
}
