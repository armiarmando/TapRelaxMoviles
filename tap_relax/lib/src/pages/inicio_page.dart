import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:tap_relax/src/resources/informacion.dart';
import 'package:tap_relax/src/resources/paginas.dart';

class PaginaInicial extends StatefulWidget {
  @override
  _PaginaInicialState createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  var currPag = 0.0;
  String tituloJuego = "Juego1";
  String descripcionJuego = "Revienta las burbujas";
  Informacion info = Informacion.logo();
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
          descripcionJuego = "Revienta las burbujas";
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                  flex: (orientation == Orientation.portrait) ? 3 : 3,
                  child: GestureDetector(
                    child: Image(
                      image: AssetImage('assets/icon/logo_sin_fondo.png'),
                      height: 100,
                      width: 100,
                    ),
                    onTap: () {
                      info.acercade(context);
                    },
                  )),
              Flexible(
                  flex: 1,
                  child: Padding(
                    child: Text(
                      "Tap Relax",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
          ),
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
                Hero(tag: 'hero1', child: Paginas(Colors.white, "Juego1")),
                Hero(tag: 'hero2', child: Paginas(Colors.white, "Juego2")),
                Hero(tag: 'hero3', child: Paginas(Colors.white, "Juego3")),
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
                  color: Colors.white,
                  width: 0.5,
                ),
              ),
              child: Container(
                  width: 160,
                  height: 40,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
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
