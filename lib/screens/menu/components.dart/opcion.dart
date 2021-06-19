import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zionApp/Constants.dart';
import 'package:zionApp/sizeConfig.dart';

class OptionMenuItem extends StatelessWidget {
  String titulo;
  PageRouteInfo<dynamic> ruta;
  OptionMenuItem({this.titulo, this.ruta});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          _irOpcion(context);
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: kDisableColor),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenWidth(5),
                horizontal: getProportionateScreenWidth(8)),
            child: Row(
              children: [
                Flexible(
                  flex: 10,
                  child: Text(titulo),
                  fit: FlexFit.tight,
                ),
                Flexible(
                  flex: 1,
                  child: Icon(Icons.arrow_forward_ios_outlined),
                  fit: FlexFit.tight,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _irOpcion(BuildContext context) {
    if (this.ruta != null) {
      AutoRouter.of(context).push(this.ruta);
    } else {
      final snackBar = SnackBar(
        content: Text(
          "Opcion ${this.titulo} no implementada",
          textAlign: TextAlign.center,
        ),
        backgroundColor: kDangerColor,
        duration: Duration(milliseconds: 1500),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
