import 'package:flutter/material.dart';
import 'package:zionapp/constants_config.dart';
import 'package:zionapp/size_config.dart';

class TablaInfo extends StatelessWidget {
  final String tipo;
  const TablaInfo(this.tipo, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight * 0.5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              width: getProportionateScreenWidth(4), color: kSecondaryColor)),
      child: Column(
        children: [
          Flexible(
            flex: 5,
            child: Container(
              color: kSecondaryColor,
              child: Column(
                children: [
                  Image.asset(
                    fondos[tipo]["imagen"],
                    width: getProportionateScreenWidth(300),
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
          const Divider(
            thickness: 2,
            height: 4,
          ),
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              child: Text(fondos[tipo]["info_general"] ??
                  "No hay informacion de este fondo"),
            ),
          ),
          Flexible(
              flex: 6,
              fit: FlexFit.tight,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                child: Column(
                  children: [
                    _rowTable("Inversion inicial",
                        fondos[tipo]["inversion_inicial"] ?? "??"),
                    _rowTable("Monto minimo de incremento",
                        fondos[tipo]["monto_minimo"] ?? "??"),
                    _rowTable("Plazo mimino de permanencia",
                        fondos[tipo]["min_permanencia"] ?? "??"),
                    _rowTable("Plazo de retiros totales o parciales",
                        fondos[tipo]["plz_retiros"] ?? "??"),
                  ],
                ),
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
            child: Text(titulo),
          ),
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: Text(descripcion),
          )
        ],
      ),
    );
  }
}
