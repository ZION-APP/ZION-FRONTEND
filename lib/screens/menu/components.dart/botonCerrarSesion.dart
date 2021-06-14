import 'package:flutter/material.dart';
import 'package:zionApp/Constants.dart';
import 'package:zionApp/sizeConfig.dart';

class LogOutButton extends StatelessWidget {
  LogOutButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.all<Size>(
              Size(double.infinity, double.minPositive)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                      color: kSecondaryColor,
                      width: getProportionateScreenHeight(1))))),
      onPressed: () {},
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
