import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:zionapp/components/show_error.dart';
import 'package:zionapp/constants_config.dart';
import 'package:zionapp/models/form.dart';

class Formulario extends StatefulWidget {
  const Formulario({Key key}) : super(key: key);

  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final formulario = FormularioForm();
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulario basico"),
      ),
      body: Theme(
        data: ThemeData(primarySwatch: MaterialColor(0xFFD0AF68, colorPrimary)),
        child: ReactiveForm(
          formGroup: formulario.form,
          child: ListView(
            children: [
              Stepper(
                type: StepperType.vertical,
                physics: ScrollPhysics(),
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
                              var fecha = (picker.value != null)
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
                    content: Column(
                      children: <Widget>[
                        // ReactiveTextField(
                        //   decoration:
                        //       InputDecoration(labelText: 'Home Address'),
                        // ),
                        // ReactiveTextField(
                        //   decoration: InputDecoration(labelText: 'Postcode'),
                        // ),
                      ],
                    ),
                    isActive: _currentStep >= 1,
                    state: _currentStep >= 1
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: const Text('Situacion Financiera'),
                    content: Column(
                      children: <Widget>[
                        // ReactiveTextField(
                        //   decoration:
                        //       InputDecoration(labelText: 'Mobile Number'),
                        // ),
                      ],
                    ),
                    isActive: _currentStep >= 2,
                    state: _currentStep >= 2
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: const Text('Informacion General'),
                    content: Column(
                      children: <Widget>[
                        // ReactiveTextField(
                        //   decoration:
                        //       InputDecoration(labelText: 'Mobile Number'),
                        // ),
                      ],
                    ),
                    isActive: _currentStep >= 3,
                    state: _currentStep >= 2
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: const Text('Ultimas consideraciones'),
                    content: Column(
                      children: <Widget>[
                        // ReactiveTextField(
                        //   decoration:
                        //       InputDecoration(labelText: 'Mobile Number'),
                        // ),
                      ],
                    ),
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
    } else {
      _currentStep < 4 ? setState(() => _currentStep += 1) : null;
    }
  }

  void tapped(int step) {
    setState(() => _currentStep = step);
  }

  void cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  Future<void> submit() async {
    try {
      await formulario.submit(context);
    } on DioError catch (e) {
      if (e.type == DioErrorType.other) {
        print(e);
        showError("Error del servidor", context);
      } else if (e.type == DioErrorType.response) {
        print(e.response);

        showError("Verifique la informacion", context);
      }
    }
  }
}
