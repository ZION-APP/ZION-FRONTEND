import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zionApp/constants.dart';
import 'package:zionApp/size_config.dart';

class OptionMenuItem extends StatelessWidget {
  String titulo;
  PageRouteInfo<dynamic> ruta;
  OptionMenuItem({this.titulo, this.ruta});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                  fit: FlexFit.tight,
                  child: Text(titulo),
                ),
                const Flexible(
                  fit: FlexFit.tight,
                  child: Icon(Icons.arrow_forward_ios_outlined),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _irOpcion(BuildContext context) {
    if (ruta != null) {
      AutoRouter.of(context).push(ruta);
    } else {
      final snackBar = SnackBar(
        content: Text(
          "Opcion $titulo no implementada",
          textAlign: TextAlign.center,
        ),
        backgroundColor: kDangerColor,
        duration: const Duration(milliseconds: 1500),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
