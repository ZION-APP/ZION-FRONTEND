import 'package:flutter/material.dart';
import 'package:zionApp/Constants.dart';
import 'package:zionApp/routes/router.gr.dart';
import 'package:zionApp/screens/menu/components.dart/botonCerrarSesion.dart';
import 'package:zionApp/screens/menu/components.dart/opcion.dart';
import 'package:zionApp/sizeConfig.dart';

class MenuHome extends StatefulWidget {
  @override
  _MenuHomeState createState() => _MenuHomeState();
}

class _MenuHomeState extends State<MenuHome> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenHeight(14),
          vertical: getProportionateScreenWidth(30)),
      child: Container(
        child: Column(
          children: [
            _submenuZion(),
            SizedBox(
              height: getProportionateScreenHeight(35),
            ),
            _submenuCuenta(),
            SizedBox(
              height: getProportionateScreenHeight(50),
            ),
            LogOutButton()
          ],
        ),
      ),
    );
  }

  Column _submenuZion() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "ZION",
          style: TextStyle(
              color: kDisableColor, fontSize: getProportionateScreenHeight(13)),
        ),
        Column(
          children: [
            OptionMenuItem(
              titulo: "Quiénes Somos",
            ),
            OptionMenuItem(
              titulo: "Preguntas frecuentes",
            ),
            OptionMenuItem(
              titulo: "Contáctanos",
            )
          ],
        )
      ],
    );
  }

  Column _submenuCuenta() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "CUENTA",
          style: TextStyle(
              color: kDisableColor, fontSize: getProportionateScreenHeight(13)),
        ),
        Column(
          children: [
            OptionMenuItem(
              titulo: "Mi Perfil",
              ruta: PerfilHomeRoute(),
            ),
            OptionMenuItem(
              titulo: "Cuenta Bancaria",
            ),
            OptionMenuItem(
              titulo: "Notificaciones",
            ),
            OptionMenuItem(
              titulo: "Términos de Servicio",
            )
          ],
        )
      ],
    );
  }
}
