import 'package:flutter/material.dart';
import 'package:zionapp/constants_config.dart';
import 'package:zionapp/components/dropdown_item.dart';

var obj = ["MENSAJE1", "MENSAJE2", "MENSAJE3"];

class Notificaciones extends StatelessWidget {
  const Notificaciones({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var list = [
      {
        'titulo': "Bienvenido a ZION",
        "date": "20/08/2016",
        "mensaje": "mensaje2loremsdjausdhasudasdasddasd"
      },
      {
        'titulo': "Actualizar estado de cuenta",
        "date": "26/08/2016",
        "mensaje": "mensaje2loremsdjausdhasudasdasddasd"
      },
      {
        'titulo': "Revisar transacciones",
        "date": "26/08/2016",
        "mensaje": "mensaje3loremsdjausdhasudasdasddasd"
      }
    ];
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        iconTheme: IconThemeData(
          color: kPrimaryLightColor,
        ),
        // ignore: prefer_const_constructors
        title: Text(
          'Notificaciones ',
          // ignore: prefer_const_constructors
          style: TextStyle(color: kPrimaryLightColor),
        ),
        centerTitle: true,
        backgroundColor: kSecondaryColor,
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: ListView(
            children: [
              for (var item in list)
                Column(
                  children: [
                    const SizedBox(height: 20),
                    Text(item['date']),
                    ExpandingItems(
                        titulo: item['titulo'], contenido: item['mensaje']),
                  ],
                ),
            ],
          )),
    );
  }
}
