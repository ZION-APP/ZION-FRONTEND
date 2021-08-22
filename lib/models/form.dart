import 'package:flutter/cupertino.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:zionapp/constants_config.dart';

class FormularioForm {
  final form = FormGroup({});
  final infoPersonal = FormGroup({
    'nombre_1': FormControl<String>(validators: [Validators.required]),
    'nombre_2': FormControl<String>(),
    'apellido_paterno': FormControl<String>(),
    'apellido_materno': FormControl<String>(),
    'fecha_nacimiento': FormControl<DateTime>(),
    'kind_of_person_id': FormControl<String>(),
  });
  final infoTrabajo = FormGroup({
    'fecha_ingreso_trabajo': FormControl<String>(),
    'fecha_constitucion_emp': FormControl<String>(),
    'fecha_vencimiento_cia': FormControl<String>(),
    'fecha_nomina_accionistas': FormControl<String>(),
    'fecha_certif_oblig': FormControl<String>(),
  });
  FormularioForm() {
    form.addAll({'info_personal': infoPersonal, 'info_trabajo': infoTrabajo});
  }
  bool isValidInfoPersonal() {
    return infoPersonal.valid;
  }

  bool isValidInfoTrabajo() {
    return infoTrabajo.valid;
  }

  dynamic getValues() {
    return {...infoTrabajo.value, ...infoPersonal.value};
  }

  Future<void> submit(BuildContext context) async {
    await dioClient.post("$kapiUrl/form/me", data: getValues());
  }
}
