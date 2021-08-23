import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zionapp/components/date_picker_default.dart';
import 'package:zionapp/components/reactive_input_default.dart';

class InfoLaboral extends StatelessWidget {
  const InfoLaboral({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ReactiveInputDefault(
          control: "info_laboral.nombre_empresa",
          labelText: "Nombre de empresa en que trabaja",
        ),
        ReactiveInputDefault(
          control: "info_laboral.ruc_empresa",
          inputType: TextInputType.number,
          labelText: "Ruc de empresa",
        ),
        ReactiveInputDefault(
          control: "info_laboral.direccion_empresa",
          labelText: "Direccion de empresa",
        ),
        ReactiveInputDefault(
          control: "info_laboral.cargo_empresa",
          labelText: "Cargo en empresa",
        ),
        DatePickerDefault(
          control: "info_laboral.fecha_ingreso_trabajo",
          labelText: "Fecha en que comenzo en su trabajo actual?",
        ),
      ],
    );
  }
}
