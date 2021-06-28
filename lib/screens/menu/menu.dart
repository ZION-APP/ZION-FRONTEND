import 'package:flutter/material.dart';
import 'package:zionapp/constants.dart';
import 'package:zionapp/routes/router.gr.dart';
import 'package:zionapp/screens/menu/components.dart/boton_cerrar_sesion.dart';
import 'package:zionapp/screens/menu/components.dart/opcion.dart';
import 'package:zionapp/size_config.dart';

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
          const LogOutButton()
        ],
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
              ruta: const VisionyMisionRoute(),
            ),
            OptionMenuItem(
              titulo: "Preguntas frecuentes",
            ),
            OptionMenuItem(
              titulo: "Contáctanos",
              ruta: const ContactanosRoute(),
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
              ruta: const PerfilHomeRoute(),
            ),
            OptionMenuItem(
              titulo: "Cuenta Bancaria",
              ruta: const CuentaBancariaRoute(),
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
