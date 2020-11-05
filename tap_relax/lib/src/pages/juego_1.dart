import 'package:flutter/material.dart';

class Juego1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text("Hola perrotes del Juego 1"),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }));
  }
}
