import 'package:flutter/material.dart';
import 'package:zionApp/constants.dart';
import 'package:zionApp/size_config.dart';

class Contactanos extends StatelessWidget {
  const Contactanos({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: kPrimaryLightColor,
          ),
          title: const Text(
            'Contactanos',
            style: TextStyle(color: kPrimaryLightColor),
          ),
          centerTitle: true,
          backgroundColor: kSecondaryColor,
        ),
        resizeToAvoidBottomInset: false,
        body: Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 10,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.phone,
                          size: 40,
                        ),
                        SizedBox(height: getProportionateScreenHeight(10)),
                        const Text(
                          "PBX",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: getProportionateScreenHeight(10)),
                        const Text(
                            "¡Llámanos! y  pregunta por nuestros fondos de inversión. "),
                        SizedBox(height: getProportionateScreenHeight(10)),
                        const Text("04-2136-479")
                      ],
                    ),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(30)),
                Card(
                  elevation: 10,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.email,
                          size: 40,
                        ),
                        SizedBox(height: getProportionateScreenHeight(10)),
                        const Text(
                          "Email",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: getProportionateScreenHeight(10)),
                        const Text(
                            "¡Escríbenos! Responderemos tus requerimientos con la brevedad posible. "),
                        SizedBox(height: getProportionateScreenHeight(10)),
                        const Text("info@zion.com.ec")
                      ],
                    ),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(30)),
                Card(
                  elevation: 10,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 40,
                        ),
                        SizedBox(height: getProportionateScreenHeight(10)),
                        const Text(
                          "Ubicacion",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: getProportionateScreenHeight(10)),
                        const Text(
                            "Parque Empresarial Colon Edif. Corporativo 4, Piso 2 Ofi.201 "),
                        SizedBox(height: getProportionateScreenHeight(10)),
                        const Text("Guayaquil")
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}
