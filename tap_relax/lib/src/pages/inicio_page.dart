import 'package:flutter/material.dart';

class PaginaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tap Relax'),
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                    child: Text("Acerca de"), value: "acercade")
              ];
            },
            onSelected: (String value) {
              if (value == "acercade") {
                _mostrarAlerta(context);
              }
            },
          )
=======
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
>>>>>>> 702eec94aa8a27804ef817744316695785038f9d
        ],
      ),
    );
  }

<<<<<<< HEAD
  void _mostrarAlerta(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: AcercaDe(),
          actions: [
            IconButton(
                icon: Icon(Icons.check),
                onPressed: () => Navigator.pop(context))
          ],
          elevation: 24.0,
        );
      },
    );
  }
}
=======
class Paginas extends StatelessWidget {
  final Color color;
  final String pag;
  const Paginas(this.color, this.pag);
>>>>>>> 702eec94aa8a27804ef817744316695785038f9d

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Column(
      children: [
        Text(
          "Tap Relax",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Padding(
          child: Text(
            "Versión 1.0",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10),
          ),
          padding: EdgeInsets.all(16.0),
        ),
        Text(
          "Programación y diseño",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15),
=======
    return GestureDetector(
      child: Container(
        child: DecoratedBox(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.contain, image: AssetImage("assets/$pag.jpg"))),
>>>>>>> 702eec94aa8a27804ef817744316695785038f9d
        ),
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.only(top: 150, bottom: 30, left: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: this.color,
        ),
<<<<<<< HEAD
        Text(
          "Armando Gutiérrez",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ],
      mainAxisSize: MainAxisSize.min,
=======
      ),
      onDoubleTap: () {
        Navigator.of(context).pushNamed(pag);
      },
>>>>>>> 702eec94aa8a27804ef817744316695785038f9d
    );
  }
}
