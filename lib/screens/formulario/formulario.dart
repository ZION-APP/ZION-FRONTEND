import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:zionapp/components/show_error.dart';
import 'package:zionapp/constants_config.dart';
import 'package:zionapp/models/form.dart';

class Formulario extends StatefulWidget {
  final int tipo;
  const Formulario({this.tipo, Key key}) : super(key: key);

  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  Map<int, String> tipos = {1: "natural", 2: "juridico"};
  final formulario = FormularioForm();
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulario basico ${tipos[widget.tipo]}"),
      ),
      body: Theme(
        data: ThemeData(primarySwatch: MaterialColor(0xFFD0AF68, colorPrimary)),
        child: ReactiveForm(
          formGroup: formulario.form,
          child: ListView(
            children: [
              Stepper(
                physics: const ScrollPhysics(),
                currentStep: _currentStep,
                onStepTapped: (step) => tapped(step),
                onStepContinue: continued,
                onStepCancel: cancel,
                steps: <Step>[
                  Step(
                    title: const Text('Informacion Personal'),
                    content: Column(
                      children: <Widget>[
                        ReactiveTextField(
                          formControlName: "info_personal.nombre_1",
                          validationMessages: (control) =>
                              {'required': "No puede estar vacio"},
                          decoration:
                              const InputDecoration(labelText: 'Primer Nombre'),
                        ),
                        ReactiveTextField(
                          formControlName: "info_personal.nombre_2",
                          decoration: const InputDecoration(
                              labelText: 'Segundo Nombre'),
                        ),
                        ReactiveTextField(
                          formControlName: "info_personal.apellido_paterno",
                          decoration: const InputDecoration(
                              labelText: 'Apellido Paterno'),
                        ),
                        ReactiveTextField(
                          formControlName: "info_personal.apellido_materno",
                          decoration: const InputDecoration(
                              labelText: 'Apellido Materno'),
                        ),
                        ReactiveDatePicker(
                            formControlName: "info_personal.fecha_nacimiento",
                            lastDate: DateTime(3000),
                            firstDate: DateTime(1900),
                            builder: (context, picker, wi) {
                              final fecha = (picker.value != null)
                                  ? "${picker.value.day}-${picker.value.month}-${picker.value.year}"
                                  : "Seleccione una fecha";
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    fecha,
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.calendar_today,
                                      color: kSecondaryColor,
                                    ),
                                    onPressed: () => picker.showPicker(),
                                  )
                                ],
                              );
                            })
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: const Text('Informacion del Conyuge'),
                    content: Column(),
                    isActive: _currentStep >= 1,
                    state: _currentStep >= 1
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: const Text('Situacion Financiera'),
                    content: Column(),
                    isActive: _currentStep >= 2,
                    state: _currentStep >= 2
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: const Text('Informacion General'),
                    content: Column(),
                    isActive: _currentStep >= 3,
                    state: _currentStep >= 2
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: const Text('Ultimas consideraciones'),
                    content: Column(),
                    isActive: _currentStep >= 4,
                    state: _currentStep >= 2
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                ],
              ),
              ReactiveFormConsumer(
                builder: (context, form, child) {
                  return TextButton(
                    onPressed: form.valid ? submit : null,
                    child: const Text('Enviar'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void continued() {
    if (_currentStep == 0 && !formulario.infoPersonal.valid) {
      showError("Ingreso todos los campos", context);
    } else if (_currentStep < 4) {
      setState(() => _currentStep += 1);
    }
  }

  void tapped(int step) {
    setState(() => _currentStep = step);
  }

  void cancel() {
    if (_currentStep > 0) setState(() => _currentStep -= 1);
  }

  Future<void> submit() async {
    try {
      await formulario.submit(context);
    } on DioError catch (e) {
      if (e.type == DioErrorType.other) {
        showError("Error del servidor", context);
      } else if (e.type == DioErrorType.response) {
        showError("Verifique la informacion", context);
      }
    }
  }
}
