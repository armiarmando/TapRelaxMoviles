import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:tap_relax/src/resources/informacion.dart';

class Juego2 extends StatefulWidget {
  @override
  _Juego2State createState() => _Juego2State();
}

class _Juego2State extends State<Juego2> {
  final audioName = "relajacion.mp3";
  AudioPlayer audioplayer;
  AudioCache audioCache;
  double _width = 40.0;
  double _height = 40.0;
  Color _color = Colors.tealAccent[400];
  Random random = Random();
  String _mensaje = "Inicia";
  String informacion =
      "El objetivo del juego es hacerla crecer y luego dejar que se haga pequeña.\n\nCuando sientas ansiedad o estrés puedes acudir a este juego para interactuar con el, inconscientemente el usuario sentirá que esa esfera es la manera en que él respira, y al hacer que se haga grande y luego pequeña impactará en su manera de respirar haciendo que se relaje de manera significante.\n\n";

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(200.0);

  @override
  Widget build(BuildContext context) {
    Informacion info = Informacion("Respiración", informacion);
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.info_outline),
              onPressed: () {
                info.card(context);
              },
            ),
          ],
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text("Juego 2: Respiración"),
          centerTitle: true,
        ),
        body: Hero(
          tag: 'hero2',
          child: Center(
            child: _inicioJuego2(),
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
    audioplayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: audioplayer);
  }

  Widget _inicioJuego2() {
    return Stack(children: [
      Card(
        elevation: 10.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Center(
          child: Text(
            _mensaje,
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
        margin: EdgeInsetsDirectional.only(bottom: 500.0),
      ),
      Container(
        margin: EdgeInsets.symmetric(vertical: 110, horizontal: 0),
        child: GestureDetector(
          onTap: () {
            audioCache.play(audioName);
            setState(() {});
            _crecer();
          },
          child: Align(
            alignment: Alignment.center,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 3000),
              width: _width,
              height: _height,
              decoration:
                  BoxDecoration(borderRadius: _borderRadius, color: _color),
            ),
          ),
        ),
      ),
    ]);
  }

  void _crecer() {
    _width = 358;
    _height = 358;
    print("Inhala");
    _mensaje = "Inhala";
    setState(() {});
    Timer(Duration(seconds: 3), () {
      _mensaje = "Mantén";
      print("Manten ");
      _width = 358;
      _height = 358;
      setState(() {});
      Timer(Duration(seconds: 3), () {
        _mensaje = "Exhala ";
        print("Exhala");
        setState(() {});
        _width = 40;
        _height = 40;
        Timer(Duration(seconds: 3), () {
          _mensaje = "Inicia";
          print("Exhala");
          _width = 40;
          _height = 40;
          setState(() {});
        });
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    audioplayer.stop();
  }
}
