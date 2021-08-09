import 'package:flutter/material.dart';
import 'package:zionapp/components/button_default.dart';
import 'package:zionapp/constants_config.dart';

class Aporte extends StatefulWidget {
  const Aporte({Key key}) : super(key: key);

  @override
  _AporteState createState() => _AporteState();
}

class _AporteState extends State<Aporte> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: ListView(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: kDisableColor),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        "Realiza un nuevo aporte",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(
                        height: 10,
                      ),
                      const Text(
                          "Aumenta la rentabilidad de tus inversiones al hacer incrementos de fondos existentes ")
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Fondos Activos",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: kPrimaryColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Fondo(titulo: "fondo1", informacion: "informacion1"),
              const SizedBox(height: 20),
              const Fondo(titulo: "fondo2", informacion: "informacion2"),
            ],
          )),
    );
  }
}

class Fondo extends StatelessWidget {
  final String titulo;
  final String informacion;

  const Fondo({this.titulo, this.informacion});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: kDisableColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text(
              titulo,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 10,
            ),
            Text(informacion),
            const SizedBox(
              height: 10,
            ),
            DefaultButton(func: () => {print("fondo")}, label: "Ver Fondo")
          ],
        ),
      ),
    );
  }
}
