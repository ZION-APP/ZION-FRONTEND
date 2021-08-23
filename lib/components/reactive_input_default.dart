import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:zionapp/constants_config.dart';
import 'package:zionapp/size_config.dart';

class ReactiveInputDefault extends StatelessWidget {
  final String labelText;
  final String control;
  final TextInputType inputType;
  const ReactiveInputDefault(
      {this.labelText, this.control, this.inputType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(15)),
      child: ReactiveTextField(
          formControlName: control,
          keyboardType: inputType,
          validationMessages: (control) => {'required': "Campo requerido"},
          decoration: inputDecoration(context, labelText)),
    );
  }
}
