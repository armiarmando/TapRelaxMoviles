import 'package:flutter/material.dart';
import 'package:tap_relax/src/pages/inicio_page.dart';
import 'package:tap_relax/src/pages/juego_1.dart';
import 'package:tap_relax/src/pages/juego_2.dart';
import 'package:tap_relax/src/pages/juego_3.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tap Relax',
        initialRoute: 'home',
        routes: {
          'home': (BuildContext contex) => PaginaInicial(),
          'Juego1': (BuildContext contex) => Juego1(),
          'Juego2': (BuildContext contex) => Juego2(),
          'Juego3': (BuildContext contex) => Juego3()
        },
        theme: ThemeData(
          primaryColor: Colors.blue[200],
        ));
  }
}
