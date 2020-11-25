import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Informacion {
  String mensaje = "";
  String nombreJuego = "";

  Informacion(this.nombreJuego, this.mensaje);
  Informacion.logo();

  Widget card(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text(this.nombreJuego),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(this.mensaje, textAlign: TextAlign.justify),
                  Image(
                    image: AssetImage('assets/icon/logo_sin_fondo.png'),
                    width: 50.0,
                    height: 50.0,
                  )
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Widget acercade(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text(this.nombreJuego),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
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
                    "aleexmorenoan@gmail.com",
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
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
