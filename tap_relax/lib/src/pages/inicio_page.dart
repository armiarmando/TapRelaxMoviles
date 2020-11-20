import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:tap_relax/src/resources/acerca_de.dart';
import 'package:tap_relax/src/resources/paginas.dart';

class PaginaInicial extends StatefulWidget {
  @override
  _PaginaInicialState createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  var currPag = 0.0;
  String tituloJuego = "Juego1";
  String descripcionJuego = "Descripción 1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _pageView(context));
  }

  Widget _pageView(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;

    return SafeArea(
      child: (orientation == Orientation.portrait)
          ? Column(
              children: getLayoutElements(context),
            )
          : Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: getLayoutElements(context),
            ),
    );
  }

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

  List<Widget> getLayoutElements(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;

    PageController _pageController = (orientation == Orientation.portrait)
        ? PageController(viewportFraction: 0.85, initialPage: currPag.round())
        : PageController(viewportFraction: 0.75, initialPage: currPag.round());

    _pageController.addListener(() {
      setState(() {
        currPag = _pageController.page;

        if (currPag == 0.0) {
          tituloJuego = "Juego1";
          descripcionJuego = "Revienta las burbujas, intenta relajarte";
        } else if (currPag == 1.0) {
          tituloJuego = "Juego2";
          descripcionJuego = "Modera tu respiración";
        } else if (currPag == 2.0) {
          tituloJuego = "Juego3";
          descripcionJuego = "Une los puntos";
        }
      });
    });

    return <Widget>[
      //Contenedor de la zona de arriba
      _flixible1(orientation),
      _flixible2(orientation, _pageController),
      //Contenedor del PageView
    ];
  }

  Widget _flixible1(Orientation orientation) {
    return Flexible(
        flex: (orientation == Orientation.portrait) ? 3 : 4,
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Flexible(
                flex: (orientation == Orientation.portrait) ? 3 : 3,
                child: GestureDetector(
                  child: Image(
                    image: AssetImage('assets/icon/logo_sin_fondo.png'),
                    height: 150,
                    width: 150,
                  ),
                  onTap: () {
                    _mostrarAlerta(context);
                  },
                )),
            Flexible(
                flex: 1,
                child: Padding(
                  child: Text(
                    "Tap Relax",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  padding: EdgeInsets.only(top: 10),
                )),
            Flexible(
                child: Padding(
                  child: DotsIndicator(dotsCount: 3, position: currPag),
                  padding: EdgeInsets.only(top: 5),
                ),
                flex: 1)
          ],
        ));
  }

  Widget _flixible2(Orientation orientation, PageController _pageController) {
    return Flexible(
        flex: (orientation == Orientation.portrait) ? 7 : 6,
        child: Stack(children: <Widget>[
          new Container(
            child: PageView(
              controller: _pageController,
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                Paginas(Colors.blue, "Juego1"),
                Paginas(Colors.blueAccent, "Juego2"),
                Paginas(Colors.lightBlueAccent, "Juego3"),
              ],
              scrollDirection: Axis.horizontal,
            ),
            color: Colors.blue[100],
          ),
          new Align(
            child: Card(
              elevation: 30,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: BorderSide(
                  color: Colors.black,
                  width: 0.5,
                ),
              ),
              child: Container(

                  //color: Colors.blue[50],
                  width: 150,
                  height: 60,
                  child: Column(children: <Widget>[
                    Text(
                      tituloJuego,
                      style: TextStyle(color: Colors.pink),
                    ),
                    Text(descripcionJuego)
                  ])),
            ),
            alignment: Alignment.bottomCenter,
          )
        ]));
  }
}
