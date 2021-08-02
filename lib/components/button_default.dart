import 'package:flutter/material.dart';
import 'package:zionapp/constants_config.dart';
import 'package:zionapp/size_config.dart';

class DefaultButton extends StatelessWidget {
  final Function func;
  final String label;
  final Color colorFondo;
  final Color colorTexto;
  final double tamanoTexto;

  const DefaultButton(
      {@required this.label,
      this.func,
      this.colorFondo = kSecondaryColor,
      this.colorTexto = kPrimaryLightColor,
      this.tamanoTexto});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(getProportionateScreenHeight(8))),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(colorFondo),
            minimumSize: MaterialStateProperty.all<Size>(Size(
                getProportionateScreenHeight(250),
                getProportionateScreenHeight(50)))),
        onPressed: func as void Function(),
        child: Text(
          label,
          style: TextStyle(
              color: colorTexto,
              fontSize: tamanoTexto ?? getProportionateScreenHeight(20)),
        ));
  }
}
