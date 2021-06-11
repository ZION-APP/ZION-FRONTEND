import 'package:flutter/material.dart';
import 'package:zionApp/Constants.dart';
import 'package:zionApp/sizeConfig.dart';

class DefaultButton extends StatelessWidget {
  final Function func;
  final String label;
  final Color colorFondo;
  final Color colorTexto;
  DefaultButton(
      {@required this.label,
      this.func,
      this.colorFondo = kSecondaryColor,
      this.colorTexto = kPrimaryLightColor});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(getProportionateScreenHeight(20))),
        color: this.colorFondo,
        onPressed: func,
        height: getProportionateScreenHeight(50),
        minWidth: getProportionateScreenHeight(250),
        child: Text(
          label,
          style: TextStyle(
              color: this.colorTexto,
              fontSize: getProportionateScreenHeight(20)),
        ));
  }
}
