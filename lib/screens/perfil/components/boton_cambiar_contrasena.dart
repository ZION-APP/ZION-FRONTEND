import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:zionapp/constants_config.dart';
import 'package:zionapp/components/input_default.dart';
import 'package:zionapp/size_config.dart';

class BotonCambiarContrasena extends StatelessWidget {
  const BotonCambiarContrasena({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
          minimumSize: MaterialStateProperty.all<Size>(
              const Size(double.infinity, double.minPositive))),
      onPressed: () {
        _showModalBottomSheet(context);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(8.0),
            horizontal: getProportionateScreenWidth(10)),
        child: const Text(
          "Cambiar mi contrasena",
          style: TextStyle(color: kPrimaryLightColor),
        ),
      ),
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    final TextEditingController viejaContrasenaController =
        TextEditingController();
    final TextEditingController nuevaContrasenaController =
        TextEditingController();
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(mainAxisSize: MainAxisSize.min, children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(10),
                  horizontal: getProportionateScreenWidth(10)),
              child: DefaultInput(
                controller: viejaContrasenaController,
                isContrasena: true,
                label: "Contrasena anterior",
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(10),
                  horizontal: getProportionateScreenWidth(10)),
              child: DefaultInput(
                controller: nuevaContrasenaController,
                isContrasena: true,
                label: "Contrasena nueva",
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(10),
                  vertical: getProportionateScreenHeight(20)),
              child: TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all<Size>(
                          const Size(double.infinity, double.minPositive)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(kPrimaryColor)),
                  child: Text(
                    "Cambiar Contrasena",
                    style: TextStyle(
                        color: kPrimaryLightColor,
                        fontSize: getProportionateScreenHeight(15)),
                  )),
            )
          ]);
        }).then((value) => {
          if (value != null && (value as bool))
            {developer.log(nuevaContrasenaController.text)}
        });
  }
}
