import 'package:flutter/material.dart';

class PaginaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _pageView());
  }

  Widget _pageView() {
    return Container(
      child: PageView(
        controller: PageController(viewportFraction: .85),
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Paginas(Colors.blue, "Juego1"),
          Paginas(Colors.blueAccent, "Juego2"),
          Paginas(Colors.lightBlueAccent, "Juego3"),
        ],
      ),
    );
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
        child: DecoratedBox(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.contain, image: AssetImage("assets/$pag.jpg"))),
        ),
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.only(top: 150, bottom: 30, left: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: this.color,
        ),
      ),
      onDoubleTap: () {
        Navigator.of(context).pushNamed(pag);
      },
    );
  }
}
