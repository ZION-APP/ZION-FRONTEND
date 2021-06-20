import 'package:flutter/material.dart';
import 'package:zionApp/constants.dart';
import 'package:zionApp/size_config.dart';

class DefaultButton extends StatelessWidget {
  final Function func;
  final String label;
  final Color colorFondo;
  final Color colorTexto;

  const DefaultButton(
      {@required this.label,
      this.func,
      this.colorFondo = kSecondaryColor,
      this.colorTexto = kPrimaryLightColor,});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(getProportionateScreenHeight(20))),
        color: colorFondo,
        onPressed: func as void Function(),
        height: getProportionateScreenHeight(50),
        minWidth: getProportionateScreenHeight(250),
        child: Text(
          label,
          style: TextStyle(
              color: colorTexto,
              fontSize: getProportionateScreenHeight(20)),
        ));
  }
}
