import 'package:flutter/material.dart';

class PaginaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                AlertaPersonalizada();
              }
            },
          )
        ],
      ),
      body: Center(child: Text('xd')),
    );
  }
}

class AlertaPersonalizada extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Tap Relax"),
      content: AcercaDe(),
      actions: [
        IconButton(
            icon: Icon(Icons.check), onPressed: () => Navigator.pop(context))
      ],
    );
  }
}

class AcercaDe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Text(
          "Tap Relax",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          "Versión 1.0",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 10),
        ),
        Text(
          "Programación y diseño",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15),
        ),
        Text(
          "Erick Moreno",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Text(
          "Armando Gutiérrez",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ],
    ));
  }
}
