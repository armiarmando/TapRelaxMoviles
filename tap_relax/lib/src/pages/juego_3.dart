import 'package:flutter/material.dart';

class Juego3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text("Hola perrotes del Juego 3"),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }));
  }
}
