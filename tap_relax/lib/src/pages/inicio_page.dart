import 'package:flutter/material.dart';

class PaginaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tap Relax'),
      ),
      body: Center(
        child: Container(
          child: Text('Que onda que pex'),
        ),
      ),
    );
  }
}
