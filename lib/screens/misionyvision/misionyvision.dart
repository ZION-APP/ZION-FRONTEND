import 'package:flutter/material.dart';
import 'package:zionapp/constants.dart';
import 'package:zionapp/size_config.dart';

class VisionyMision extends StatelessWidget {
  const VisionyMision({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: kPrimaryLightColor,
          ),
          title: const Text(
            'Vision y Mision',
            style: TextStyle(color: kPrimaryLightColor),
          ),
          centerTitle: true,
          backgroundColor: kSecondaryColor,
        ),
        resizeToAvoidBottomInset: false,
        body: Container(
            margin: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Mision",
                  style: TextStyle(
                      color: kSecondaryColor,
                      fontSize: getProportionateScreenHeight(36),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5.0),
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                const Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text(
                      "Ofrecer servicios fiduciarios que permitan fomentar el ahorro, contribuir positivamente con el rendimiento y desarrollo económico de nuestros clientes.",
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(30)),
                Text(
                  "Vision",
                  style: TextStyle(
                      color: kSecondaryColor,
                      fontSize: getProportionateScreenHeight(36),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5.0),
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                const Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text(
                      "Ser reconocidos como la administradora de fondos y fideicomisos más destacada del Ecuador, respecto a la administración responsable de su patrimonio, fomentando el desarrollo sostenible.",
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ],
            )));
  }
}
