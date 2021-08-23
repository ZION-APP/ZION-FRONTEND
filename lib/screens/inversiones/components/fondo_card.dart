import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zionapp/components/button_default.dart';
import 'package:zionapp/constants_config.dart';
import 'package:zionapp/routes/router.gr.dart';
import 'package:zionapp/size_config.dart';

class FondoCard extends StatelessWidget {
  const FondoCard({
    Key key,
    @required this.tipo,
  }) : super(key: key);

  final String tipo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(14)),
      child: Column(children: [
        Image.asset(
          fondos[tipo]["banner"] as String,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Container(
          width: double.infinity,
          height: SizeConfig.screenHeight * 0.25,
          decoration: BoxDecoration(
              border: Border.all(color: kSecondaryColor, width: 4)),
          child: Column(
            children: [
              _rowTable("Rendimiento Promedio",
                  fondos[tipo]["ren_promedio"] as String ?? "??"),
              _rowTable("Permanencia minima",
                  fondos[tipo]["min_permanencia"] as String ?? "??"),
              _rowTable("Inversion Inicial",
                  fondos[tipo]["inversion_inicial"] as String ?? "??"),
              Flexible(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenHeight(20)),
                  child: DefaultButton(
                    func: () => {
                      AutoRouter.of(context).push(InfoFondoRoute(tipo: tipo))
                    },
                    label: "Invertir en este fondo",
                    colorFondo: kPrimaryColor,
                    colorTexto: kSecondaryColor,
                    tamanoTexto: getProportionateScreenHeight(16),
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }

  Widget _rowTable(String titulo, String descripcion) {
    return Flexible(
      flex: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(10),
            horizontal: getProportionateScreenWidth(8)),
        child: Row(
          children: [
            Flexible(
              flex: 7,
              fit: FlexFit.tight,
              child: Text(
                titulo,
                style: TextStyle(
                    fontSize: getProportionateScreenHeight(12),
                    color: kSecondaryColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Flexible(
              flex: 5,
              fit: FlexFit.tight,
              child: Text(
                descripcion,
                style: TextStyle(
                    color: kSecondaryColor,
                    fontSize: getProportionateScreenHeight(12)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
