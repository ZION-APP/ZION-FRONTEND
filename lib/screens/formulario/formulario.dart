import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:zionapp/components/button_default.dart';
import 'package:zionapp/components/cargando.dart';
import 'package:zionapp/components/show_error.dart';
import 'package:zionapp/constants_config.dart';
import 'package:zionapp/models/form.dart';
import 'package:zionapp/routes/router.gr.dart';
import 'package:zionapp/screens/formulario/components/info_general.dart';
import 'package:zionapp/screens/formulario/components/info_laboral.dart';
import 'package:zionapp/screens/formulario/components/info_personal.dart';
import 'package:zionapp/size_config.dart';

class Formulario extends StatefulWidget {
  final int tipoPersona;
  final String tipoFondo;
  const Formulario({this.tipoFondo, this.tipoPersona, Key key})
      : super(key: key);

  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  Map<int, String> tipos = {1: "natural", 2: "juridico"};
  final formulario = FormularioForm();
  int _currentStep = 0;
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulario basico ${tipos[widget.tipoPersona]}"),
      ),
      body: _loading
          ? Cargando()
          : Theme(
              data: ThemeData(
                  primarySwatch: MaterialColor(0xFFD0AF68, colorPrimary)),
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
                      controlsBuilder: controles,
                      steps: <Step>[
                        Step(
                          title: const Text('Informacion Personal'),
                          content: InfoPersonalStep(),
                          isActive: _currentStep >= 0,
                          state: formulario.infoPersonal.valid
                              ? StepState.complete
                              : StepState.disabled,
                        ),
                        Step(
                          title: const Text('Informacion Laboral'),
                          content: const InfoLaboral(),
                          isActive: _currentStep >= 1,
                          state: formulario.infoTrabajo.valid
                              ? StepState.complete
                              : StepState.disabled,
                        ),
                        Step(
                          title: const Text('Informacion General'),
                          content: const InfoGeneralStep(),
                          isActive: _currentStep >= 2,
                          state: formulario.infoGeneral.valid
                              ? StepState.complete
                              : StepState.disabled,
                        ),
                      ],
                    ),
                    ReactiveFormConsumer(
                      builder: (context, form, child) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(80)),
                          child: DefaultButton(
                            func: form.valid ? submit : () {},
                            colorFondo:
                                form.valid ? kSecondaryColor : kDisableColor,
                            label: 'Enviar',
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget controles(BuildContext context,
      {void Function() onStepContinue, void Function() onStepCancel}) {
    return Padding(
      padding: EdgeInsets.only(top: getProportionateScreenHeight(10)),
      child: Row(
        children: <Widget>[
          if (_currentStep != 2)
            Padding(
              padding: EdgeInsets.only(right: getProportionateScreenWidth(20)),
              child: TextButton(
                onPressed: onStepContinue,
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(kPrimaryColor)),
                child: const Text(
                  'CONTINUAR',
                  style: TextStyle(color: kPrimaryLightColor),
                ),
              ),
            ),
          if (_currentStep != 0)
            TextButton(
              onPressed: onStepCancel,
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(kDisableColor)),
              child: const Text(
                'REGRESAR',
                style: TextStyle(color: kPrimaryLightColor),
              ),
            ),
        ],
      ),
    );
  }

  void continued() {
    if (_currentStep != 2) {
      setState(() => _currentStep++);
    }
  }

  void tapped(int step) {
    if (_currentStep >= step) setState(() => _currentStep = step);
  }

  void cancel() {
    if (_currentStep > 0) setState(() => _currentStep -= 1);
  }

  Future<void> submit() async {
    setState(() {
      _loading = true;
    });
    try {
      await formulario.submit(widget.tipoPersona);
      await AutoRouter.of(context)
          .replace(CreacionFondoRoute(tipo: widget.tipoFondo));
    } on DioError catch (e) {
      if (e.type == DioErrorType.other) {
        showError("Error del servidor", context);
      } else if (e.type == DioErrorType.response) {
        showError("Verifique la informacion", context);
      }
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
