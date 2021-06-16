import 'package:flutter/material.dart';
import 'package:zionApp/Constants.dart';
import 'package:zionApp/components/button_default.dart';
import 'package:zionApp/sizeConfig.dart';

class Informacion extends StatelessWidget {
  Informacion({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kPrimaryLightColor,
        ),
        title: Text(
          'Mas informacion',
          style: TextStyle(color: kPrimaryLightColor),
        ),
        centerTitle: true,
        backgroundColor: kSecondaryColor,
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(25)),
              child: DefaultButton(
                func: () => {},
                label: "Mision y Vision",
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(25)),
              child: DefaultButton(
                func: () => {},
                label: "Preguntas Frecuentes",
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(25)),
              child: DefaultButton(
                func: () => {},
                label: "Fondos",
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(25)),
              child: DefaultButton(
                func: () => {},
                label: "Contactanos",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
