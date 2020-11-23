import 'package:flutter/material.dart';

class AcercaDe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Text(
          "Tap Relax",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Padding(
          child: Image(
            image: AssetImage('assets/icon/logo_sin_fondo.png'),
            height: 80,
            width: 80,
          ),
          padding: EdgeInsets.all(7.0),
        ),
        Padding(
          child: Text(
            "Versión 1.0",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10),
          ),
          padding: EdgeInsets.all(10.0),
        ),
        Text(
          "Programación y diseño",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15),
        ),
        Text(
          "Erick Moreno",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Text(
          "correoelectronico@gmail.com",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14),
        ),
        Text(
          "Armando Gutiérrez",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Text(
          "gutierrezmartinezjosearmando@gmail.com",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14),
        ),
        SizedBox(
          height: 20,
        ),
        Icon(Icons.info_outline)
      ],
      mainAxisSize: MainAxisSize.min,
    ));
  }
}
