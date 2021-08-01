import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zionapp/constants_config.dart';
import 'package:zionapp/screens/tipos_fondo/components/tabla_info.dart';
import 'package:zionapp/size_config.dart';

// ignore: must_be_immutable
class InfoFondo extends StatelessWidget {
  String tipo;
  InfoFondo({Key key, @PathParam('tipo') this.tipo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(fondos[tipo]["titulo"] ?? "No existe fondo"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(20),
                    horizontal: getProportionateScreenWidth(10)),
                child: TablaInfo(tipo),
              )
            ],
          ),
        ));
  }
}
