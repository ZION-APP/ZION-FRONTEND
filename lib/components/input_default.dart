import 'package:flutter/material.dart';
import 'package:zionapp/size_config.dart';

class DefaultInput extends StatelessWidget {
  final TextEditingController controller;
  final Function validacion;
  final bool isContrasena;
  final String label;
  final TextInputType inputType;
  const DefaultInput(
      {@required this.controller,
      this.validacion,
      @required this.isContrasena,
      this.label,
      this.inputType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validacion as String Function(String),
      controller: controller,
      keyboardType: inputType ?? TextInputType.text,
      obscureText: isContrasena,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(
              vertical: getProportionateScreenWidth(10),
              horizontal: getProportionateScreenHeight(5))),
    );
  }
}
