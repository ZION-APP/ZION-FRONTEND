import 'package:flutter/material.dart';
import 'package:zionapp/constants_config.dart';

class Formulario extends StatefulWidget {
  const Formulario({Key key}) : super(key: key);

  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulario basico"),
      ),
      body: Theme(
        data: ThemeData(primarySwatch: MaterialColor(0xFFD0AF68, colorPrimary)),
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
                  title: new Text('Informacion Personal'),
                  content: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Email Address'),
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Password'),
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 0
                      ? StepState.complete
                      : StepState.disabled,
                ),
                Step(
                  title: new Text('Informacion del Conyuge'),
                  content: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Home Address'),
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Postcode'),
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 1,
                  state: _currentStep >= 1
                      ? StepState.complete
                      : StepState.disabled,
                ),
                Step(
                  title: new Text('Situacion Financiera'),
                  content: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Mobile Number'),
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 2,
                  state: _currentStep >= 2
                      ? StepState.complete
                      : StepState.disabled,
                ),
                Step(
                  title: new Text('Informacion General'),
                  content: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Mobile Number'),
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 3,
                  state: _currentStep >= 2
                      ? StepState.complete
                      : StepState.disabled,
                ),
                Step(
                  title: new Text('Ultimas consideraciones'),
                  content: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Mobile Number'),
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 4,
                  state: _currentStep >= 2
                      ? StepState.complete
                      : StepState.disabled,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void continued() {
    _currentStep < 4 ? setState(() => _currentStep += 1) : null;
  }

  void tapped(int step) {
    setState(() => _currentStep = step);
  }

  void cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}