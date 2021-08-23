import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zionapp/components/date_picker_default.dart';
import 'package:zionapp/components/reactive_input_default.dart';

class InfoPersonalStep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        ReactiveInputDefault(
          control: "info_personal.nombre_1",
          labelText: "Primer nombre",
        ),
        ReactiveInputDefault(
          control: "info_personal.nombre_2",
          labelText: "Segundo nombre",
        ),
        ReactiveInputDefault(
          control: "info_personal.apellido_paterno",
          labelText: "Apellido Paterno",
        ),
        ReactiveInputDefault(
          control: "info_personal.apellido_materno",
          labelText: "Apellido Materno",
        ),
        ReactiveInputDefault(
          control: "info_personal.identificacion",
          inputType: TextInputType.number,
          labelText: "Numero de identificacion",
        ),
        ReactiveInputDefault(
          control: "info_personal.direccion_hogar",
          labelText: "Domicilio actual",
        ),
        DatePickerDefault(
          control: "info_personal.fecha_nacimiento",
          labelText: "Fecha de nacimiento",
        )
      ],
    );
  }
}
