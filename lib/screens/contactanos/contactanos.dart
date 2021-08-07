import 'package:flutter/material.dart';
import 'package:zionApp/Constants.dart';
import 'package:zionApp/sizeConfig.dart';

class Contactanos extends StatelessWidget {
  Contactanos({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: kPrimaryLightColor,
          ),
          title: Text(
            'Contactanos',
            style: TextStyle(color: kPrimaryLightColor),
          ),
          centerTitle: true,
          backgroundColor: kSecondaryColor,
        ),
        resizeToAvoidBottomInset: false,
        body: Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.phone,
                          size: 40,
                        ),
                        SizedBox(height: getProportionateScreenHeight(10)),
                        Text(
                          "PBX",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: getProportionateScreenHeight(10)),
                        Text(
                            "¡Llámanos! y  pregunta por nuestros fondos de inversión. "),
                        SizedBox(height: getProportionateScreenHeight(10)),
                        Text("04-2136-479")
                      ],
                    ),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(30)),
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.email,
                          size: 40,
                        ),
                        SizedBox(height: getProportionateScreenHeight(10)),
                        Text(
                          "Email",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: getProportionateScreenHeight(10)),
                        Text(
                            "¡Escríbenos! Responderemos tus requerimientos con la brevedad posible. "),
                        SizedBox(height: getProportionateScreenHeight(10)),
                        Text("info@zion.com.ec")
                      ],
                    ),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(30)),
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 40,
                        ),
                        SizedBox(height: getProportionateScreenHeight(10)),
                        Text(
                          "Ubicacion",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: getProportionateScreenHeight(10)),
                        Text(
                            "Parque Empresarial Colon Edif. Corporativo 4, Piso 2 Ofi.201 "),
                        SizedBox(height: getProportionateScreenHeight(10)),
                        Text("Guayaquil")
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}
