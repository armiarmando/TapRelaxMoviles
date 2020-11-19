import 'package:flutter/material.dart';

class Paginas extends StatelessWidget {
  final Color color;
  final String pag;
  const Paginas(this.color, this.pag);

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;

    return GestureDetector(
      child: Container(
        child: DecoratedBox(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.contain, image: AssetImage("assets/$pag.jpg"))),
        ),
        height: double.infinity,
        width: double.infinity,
        margin: (orientation == Orientation.portrait)
            ? EdgeInsets.only(top: 10, bottom: 20, left: 10)
            : EdgeInsets.only(top: 10, bottom: 20, left: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: this.color,
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(pag);
      },
    );
  }
}
