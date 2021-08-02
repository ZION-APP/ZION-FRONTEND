import 'package:flutter/material.dart';
import 'package:zionapp/constants_config.dart';
import 'package:zionapp/size_config.dart';

class TablaInfo extends StatelessWidget {
  final String tipo;
  const TablaInfo(this.tipo, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight * 0.6,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              width: getProportionateScreenWidth(4), color: kSecondaryColor)),
      child: Column(
        children: [
          Flexible(
            flex: 3,
            child: Container(
              color: kSecondaryColor,
              child: Column(
                children: [
                  Image.asset(
                    fondos[tipo]["imagen"] as String,
                    width: getProportionateScreenWidth(200),
                  ),
                  Center(
                      child: Text(
                    "Informacion General",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: getProportionateScreenHeight(15)),
                  )),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(14),
                  horizontal: getProportionateScreenWidth(10)),
              child: Text(
                fondos[tipo]["info_general"] as String ??
                    "No hay informacion de este fondo",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: getProportionateScreenHeight(13),
                    color: kSecondaryColor),
              ),
            ),
          ),
          Divider(
            thickness: 2,
            height: 4,
            indent: getProportionateScreenWidth(20),
            endIndent: getProportionateScreenWidth(20),
          ),
          Flexible(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(4),
                    horizontal: getProportionateScreenWidth(8)),
                child: Column(
                  children: [
                    _rowTable("Inversion inicial",
                        fondos[tipo]["inversion_inicial"] as String ?? "??"),
                    _rowTable("Monto minimo de incremento",
                        fondos[tipo]["monto_minimo"] as String ?? "??"),
                    _rowTable("Plazo mimino de permanencia",
                        fondos[tipo]["min_permanencia"] as String ?? "??"),
                    _rowTable("Plazo de retiros totales o parciales",
                        fondos[tipo]["plz_retiros"] as String ?? "??"),
                  ],
                ),
              )),
          Divider(
            thickness: 3,
            height: 4,
            indent: getProportionateScreenWidth(20),
            endIndent: getProportionateScreenWidth(20),
          ),
          Flexible(
              flex: 4,
              child: Column(
                children: [
                  Text(
                    "Calificacion de riesgos",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kSecondaryColor,
                        fontSize: getProportionateScreenHeight(14)),
                  ),
                  Image.asset("assets/img/certificacion_zion.PNG")
                ],
              ))
        ],
      ),
    );
  }

  Widget _rowTable(String titulo, String descripcion) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Flexible(
            flex: 8,
            fit: FlexFit.tight,
            child: Text(
              titulo,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: kSecondaryColor),
            ),
          ),
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: Text(
              descripcion,
              style: const TextStyle(color: kSecondaryColor),
            ),
          )
        ],
      ),
    );
  }
}
