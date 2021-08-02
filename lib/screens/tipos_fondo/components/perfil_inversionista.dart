import 'package:flutter/material.dart';
import 'package:zionapp/constants_config.dart';
import 'package:zionapp/size_config.dart';

class PerfilInversionista extends StatelessWidget {
  final String tipo;
  const PerfilInversionista(this.tipo, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final perfilInv = fondos[tipo]["perfil_inv"] as List;
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                width: getProportionateScreenWidth(4), color: kSecondaryColor)),
        child: Column(
          children: [
            Container(
              height: SizeConfig.screenHeight * 0.08,
              decoration: const BoxDecoration(color: kSecondaryColor),
              child: Center(
                child: Text(
                  "Perfil de Inversionista",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenHeight(15),
                      color: kPrimaryLightColor),
                ),
              ),
            ),
            Column(
                children: List.generate(perfilInv.length, (index) {
              return _entradaIcon(
                  perfilInv[index]["icon"] as IconData ??
                      Icons.help_outline_sharp,
                  perfilInv[index]["descripcion"] as String ??
                      "No existe descripcion");
            })),
          ],
        ));
  }

  Widget _entradaIcon(IconData iconData, String descripcion) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(10),
          horizontal: getProportionateScreenWidth(15)),
      child: Column(
        children: [
          Icon(
            iconData,
            size: getProportionateScreenHeight(40),
            color: kSecondaryColor,
          ),
          SizedBox(
            height: getProportionateScreenHeight(5),
          ),
          Text(
            descripcion,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: kSecondaryColor,
            ),
          )
        ],
      ),
    );
  }
}
