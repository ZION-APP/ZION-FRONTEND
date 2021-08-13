import 'package:flutter/material.dart';

class DefaultInput extends StatelessWidget {
  final TextEditingController controller;
  final Function validacion;
  final bool isContrasena;
  final String label;
  const DefaultInput(
      {@required this.controller,
      this.validacion,
      @required this.isContrasena,
      this.label});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validacion as String Function(String),
      controller: controller,
      obscureText: isContrasena,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.width * (10/375),
              horizontal: MediaQuery.of(context).size.height * (5/812))),
    );
  }
}
