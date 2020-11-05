import 'package:flutter/material.dart';

class Juego1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: scroll(context),
    );
  }

  Widget scroll(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue,
        ),
      ),
      onTap: () {
        print("Estoy apretando el boton 1");
        Navigator.of(context).pushNamed('Juego1');
      },
    );
  }
}
