import 'package:reactive_forms/reactive_forms.dart';
import 'package:zionapp/constants_config.dart';

class FormularioForm {
  final form = FormGroup({});
  final infoPersonal = FormGroup({
    'nombre_1': FormControl<String>(validators: [Validators.required]),
    'nombre_2': FormControl<String>(validators: [Validators.required]),
    'apellido_paterno': FormControl<String>(validators: [Validators.required]),
    'apellido_materno': FormControl<String>(validators: [Validators.required]),
    'identificacion': FormControl<String>(validators: [Validators.required]),
    'fecha_nacimiento': FormControl<String>(validators: [Validators.required]),
    'direccion_hogar': FormControl<String>(validators: [Validators.required]),
    'kind_of_person_id': FormControl<String>(),
  });
  final infoTrabajo = FormGroup({
    'nombre_empresa': FormControl<String>(validators: [Validators.required]),
    'ingreso_mensual':
        FormControl<double>(value: 0, validators: [Validators.required]),
    'cargo_empresa': FormControl<String>(validators: [Validators.required]),
    'ruc_empresa': FormControl<String>(validators: [Validators.required]),
    'direccion_empresa': FormControl<String>(validators: [Validators.required]),
    'fecha_ingreso_trabajo':
        FormControl<String>(validators: [Validators.required]),
    // 'fecha_constitucion_emp':
    //     FormControl<String>(validators: [Validators.required]),
    // 'fecha_vencimiento_cia':
    //     FormControl<String>(validators: [Validators.required]),
    // 'fecha_nomina_accionistas':
    //     FormControl<String>(validators: [Validators.required]),
    // 'fecha_certif_oblig':
    //     FormControl<String>(validators: [Validators.required]),
  });
  final infoGeneral = FormGroup({
    // 'tiene_conyuge': FormControl<bool>(validators: [Validators.required]),
    'nombre_conyuge': FormControl<String>(validators: [Validators.required]),
    'apellido_conyuge': FormControl<String>(validators: [Validators.required]),
    'ingreso_mensual_conyuge':
        FormControl<double>(validators: [Validators.required], value: 0),
  });
  FormularioForm() {
    form.addAll({
      'info_personal': infoPersonal,
      'info_laboral': infoTrabajo,
      'info_general': infoGeneral
    });
  }
  bool isValidInfoPersonal() {
    return infoPersonal.valid;
  }

  bool isValidInfoTrabajo() {
    return infoTrabajo.valid;
  }

  Map<String, dynamic> getValues() {
    return {
      ...infoTrabajo.rawValue,
      ...infoPersonal.rawValue,
      ...infoGeneral.rawValue
    };
  }

  Future<void> submit(int tipo) async {
    final data = getValues();
    data.addAll({"kind_of_person_id": tipo});
    await dioClient.post("$kapiUrl/form/me", data: data);
  }
}
