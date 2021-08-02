import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zionapp/constants_config.dart';
import 'package:zionapp/screens/tipos_fondo/components/grafico_inversores.dart';
import 'package:zionapp/screens/tipos_fondo/components/perfil_inversionista.dart';
import 'package:zionapp/screens/tipos_fondo/components/tabla_info.dart';
import 'package:zionapp/size_config.dart';

import 'components/bottom_bar_inversion.dart';

// ignore: must_be_immutable
class InfoFondo extends StatelessWidget {
  String tipo;
  InfoFondo({Key key, @PathParam('tipo') this.tipo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(fondos[tipo]["titulo"] as String ?? "No existe fondo"),
          centerTitle: true,
        ),
        body: Column(children: [
          Expanded(
            flex: 8,
            child: ListView(
              children: [
                itemList(TablaInfo(tipo)),
                itemList(PerfilInversionista(tipo)),
                itemList(GraficoInversores(tipo)),
              ],
            ),
          ),
          BottomBarInversion(tipo)
        ]));
  }

  Padding itemList(Widget child) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(20),
          horizontal: getProportionateScreenWidth(10)),
      child: child,
    );
  }
}
