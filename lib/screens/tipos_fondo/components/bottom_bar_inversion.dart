import 'package:flutter/material.dart';
import 'package:zionapp/components/button_default.dart';
import 'package:zionapp/constants_config.dart';
import 'package:zionapp/size_config.dart';

class BottomBarInversion extends StatelessWidget {
  const BottomBarInversion({
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
            func: () {},
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
            func: () {},
            colorFondo: kPrimaryColor,
            colorTexto: kSecondaryColor,
            tamanoTexto: getProportionateScreenHeight(15),
          ),
        )),
      ]),
    ));
  }
}
