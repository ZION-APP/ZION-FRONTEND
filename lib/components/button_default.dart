import 'package:flutter/material.dart';
import 'package:zionapp/constants_config.dart';

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
                      BorderRadius.circular(MediaQuery.of(context).size.height * (8/812))),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(colorFondo),
            minimumSize: MaterialStateProperty.all<Size>(Size(
                MediaQuery.of(context).size.height * (250/812),
                MediaQuery.of(context).size.height * (50/812)))),
        onPressed: func as void Function(),
        child: Text(
          label,
          style: TextStyle(
              color: colorTexto,
              fontSize: tamanoTexto ?? MediaQuery.of(context).size.height * (20/812)),
        ));
  }
}
