import 'package:flutter/material.dart';

class Juego2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text("Hola perrotes del Juego 2"),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }));
  }
}
