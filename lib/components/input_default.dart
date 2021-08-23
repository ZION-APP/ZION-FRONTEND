import 'package:flutter/material.dart';
import 'package:zionapp/constants_config.dart';

class DefaultInput extends StatelessWidget {
  final TextEditingController controller;
  final Function validacion;
  final bool isContrasena;
  final String label;
  final TextInputType inputType;
  const DefaultInput(
      { Key key,
      @required this.controller,
      this.validacion,
      @required this.isContrasena,
      this.label,
      this.inputType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validacion as String Function(String),
      controller: controller,
      keyboardType: inputType ?? TextInputType.text,
      obscureText: isContrasena,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: inputDecoration(context, label),
    );
  }
}
