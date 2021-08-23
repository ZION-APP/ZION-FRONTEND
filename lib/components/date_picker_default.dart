import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:zionapp/constants_config.dart';

class DatePickerDefault extends StatelessWidget {
  final String control;
  final String labelText;
  final DateTime lastDate;
  final DateTime firstDate;
  const DatePickerDefault({
    this.control,
    this.labelText,
    this.firstDate,
    this.lastDate,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReactiveDatePicker(
        formControlName: control,
        lastDate: lastDate ?? DateTime(3000),
        firstDate: firstDate ?? DateTime(1900),
        builder: (context, picker, wi) {
          final fecha = (picker.value != null)
              ? "${picker.value.day}-${picker.value.month}-${picker.value.year}"
              : null;

          final TextEditingController text = TextEditingController(text: fecha);
          return TextFormField(
            controller: text,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              return (value == null) ? "Campo requerido" : null;
            },
            keyboardType: TextInputType.none,
            onTap: () => picker.showPicker(),
            decoration: inputDecoration(context, labelText),
          );
        });
  }
}
