import 'package:flutter/material.dart';
import 'package:tap_relax/src/pages/inicio_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tap Relax',
      initialRoute: 'home',
      routes: {'home': (BuildContext contex) => PaginaInicial()},
    );
  }
}
