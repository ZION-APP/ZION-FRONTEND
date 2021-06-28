import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zionapp/constants_config.dart';
import 'package:zionapp/routes/router.gr.dart';
import 'package:zionapp/size_config.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.all<Size>(
              const Size(double.infinity, double.minPositive)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                      color: kSecondaryColor,
                      width: getProportionateScreenHeight(1))))),
      onPressed: () {
        AutoRouter.of(context).replaceAll([const LoginRoute()]);
      },
      child: Text(
        "Cerrar sesión",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: getProportionateScreenHeight(15),
            color: kSecondaryColor),
      ),
    );
  }
}
