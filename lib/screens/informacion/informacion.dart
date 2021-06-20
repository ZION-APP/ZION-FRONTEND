import 'package:flutter/material.dart';
import 'package:zionApp/constants.dart';
import 'package:zionApp/components/button_default.dart';
import 'package:zionApp/routes/router.gr.dart';
import 'package:zionApp/size_config.dart';
import 'package:auto_route/auto_route.dart';

class Informacion extends StatelessWidget {
  const Informacion({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: kPrimaryLightColor,
        ),
        title: const Text(
          'Mas informacion',
          style: TextStyle(color: kPrimaryLightColor),
        ),
        centerTitle: true,
        backgroundColor: kSecondaryColor,
      ),
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(25)),
              child: DefaultButton(
                func: () => {context.router.push(VisionyMisionRoute())},
                label: "Quienes Somos",
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
                func: () => {context.router.push(ContactanosRoute())},
                label: "Contactanos",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
