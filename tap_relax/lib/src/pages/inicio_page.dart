import 'package:flutter/material.dart';

import 'package:tap_relax/src/pages/juego_1.dart';
import 'package:tap_relax/src/pages/juego_2.dart';
import 'package:tap_relax/src/pages/juego_3.dart';

class PaginaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      controller: PageController(viewportFraction: .85),
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        Paginas(Colors.blue, "Juego1"),
        Paginas(Colors.blueAccent, "Juego2"),
        Paginas(Colors.lightBlueAccent, "Juego3"),
      ],
    ));
  }
}

class Paginas extends StatelessWidget {
  final Color color;
  final String pag;
  const Paginas(this.color, this.pag);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: this.color,
        ),
      ),
      onTap: () {
        print("Estoy apretando el boton para el juego $pag");
        Navigator.of(context).pushNamed(pag);
      },
    );
  }
}
