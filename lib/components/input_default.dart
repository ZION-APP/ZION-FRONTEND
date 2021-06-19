import 'package:flutter/material.dart';
import 'package:zionApp/sizeConfig.dart';

class DefaultInput extends StatelessWidget {
  final TextEditingController controller;
  final Function validacion;
  final bool isContrasena;
  final String label;
  DefaultInput(
      {@required this.controller,
      this.validacion,
      @required this.isContrasena,
      this.label});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: this.validacion,
      controller: this.controller,
      obscureText: isContrasena,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          labelText: this.label,
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(
              vertical: getProportionateScreenWidth(10),
              horizontal: getProportionateScreenHeight(5))),
    );
  }
}
