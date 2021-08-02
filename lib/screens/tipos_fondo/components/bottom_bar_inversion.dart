import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zionapp/components/button_default.dart';
import 'package:zionapp/constants_config.dart';
import 'package:zionapp/routes/router.gr.dart';
import 'package:zionapp/size_config.dart';

class BottomBarInversion extends StatelessWidget {
  final String tipo;
  const BottomBarInversion(
    this.tipo, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SizedBox(
      width: double.infinity,
      child: Row(children: [
        Expanded(
            child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(12),
              vertical: getProportionateScreenHeight(20)),
          child: DefaultButton(
            label: "Invertir ",
            func: () {
              AutoRouter.of(context).push(CreacionFondoRoute(tipo: tipo));
            },
            tamanoTexto: getProportionateScreenHeight(15),
          ),
        )),
        Expanded(
            child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(12),
              vertical: getProportionateScreenHeight(20)),
          child: DefaultButton(
            label: "Reglamentos",
            func: () {
              AutoRouter.of(context).push(const ReglamentoRoute());
            },
            colorFondo: kPrimaryColor,
            colorTexto: kSecondaryColor,
            tamanoTexto: getProportionateScreenHeight(15),
          ),
        )),
      ]),
    ));
  }
}
