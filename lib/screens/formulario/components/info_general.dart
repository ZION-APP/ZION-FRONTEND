import 'package:flutter/material.dart';
import 'package:zionapp/components/reactive_input_default.dart';

class InfoGeneralStep extends StatelessWidget {
  const InfoGeneralStep({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ReactiveInputDefault(
          control: "info_general.nombre_conyuge",
          labelText: "Nombre del conyuge",
        ),
        ReactiveInputDefault(
          control: "info_general.apellido_conyuge",
          labelText: "Apellido del conyuge",
        ),
        ReactiveInputDefault(
          control: "info_general.ingreso_mensual_conyuge",
          inputType: TextInputType.number,
          labelText: "Ingreso mensual del conyugue",
        )
      ],
    );
  }
}
