import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:zionapp/constants_config.dart';
import 'package:zionapp/components/button_default.dart';
import 'package:zionapp/components/input_default.dart';
import 'package:zionapp/routes/router.gr.dart';
import 'package:zionapp/size_config.dart';
import 'package:zionapp/validator/validator.dart';

// ignore: must_be_immutable
class FormularioGoalCreation extends StatefulWidget {
  TextEditingController nombreController;
  TextEditingController totalController;
  TextEditingController inversionInicialController;
  GlobalKey<FormState> formKey;

  FormularioGoalCreation(
      {this.nombreController,
      this.totalController,
      this.inversionInicialController,
      this.formKey});

  @override
  _FormularioGoalCreationState createState() => _FormularioGoalCreationState();
}

class _FormularioGoalCreationState extends State<FormularioGoalCreation> {
  DateTime _dateTime;
  int goalId;

  String getDateText() {
    if (_dateTime == null) {
      return 'Fecha final de la meta';
    } else {
      return '${_dateTime.month}/${_dateTime.day}/${_dateTime.year}';
    }
  }

  Future<void> createNewGoal() async {
    goalId = null;
    try {
      final String token = await storage.read(key: 'token');
      final Response response = await dioClient.post('$kapiUrl/goals/me', 
                                      options: Options(headers: {'Authorization': token}),
                                      data: {
                                        'name':widget.nombreController.text,
                                        'init_amount':(double.parse(widget.inversionInicialController.text)).toInt(),
                                        'target_amount':(double.parse(widget.totalController.text)).toInt(),
                                        'target_date':'${_dateTime.year}-${_dateTime.month}-${_dateTime.day}'
                                      });
      setState(() {
        goalId = response.data['goal']['id'] as int;
      });
      widget.nombreController.clear();
      widget.totalController.clear();
      widget.inversionInicialController.clear();
      setState(() {
        _dateTime = null;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void showErrorSnack(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
      backgroundColor: kDangerColor,
      duration: const Duration(milliseconds: 1500),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.formKey,
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(40)),
            const Text(
              'Registro de una nueva Meta',
              style: TextStyle(fontSize: 21),
            ),
            SizedBox(height: getProportionateScreenHeight(40)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(50)),
              child: DefaultInput(
                controller: widget.nombreController,
                isContrasena: false,
                validacion: Validadores.validarNombreLargo,
                label: "Nombre de la meta",
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(50)),
              child: DefaultInput(
                controller: widget.totalController,
                isContrasena: false,
                validacion: Validadores.validarValorMonetario,
                label: "Cuánto es el monto total para la meta?",
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(50)),
              child: OutlinedButton.icon(
                icon: const IconTheme(
                  data: IconThemeData(color: Colors.black45),
                  child: Icon(Icons.date_range),
                ),
                style: OutlinedButton.styleFrom(
                  minimumSize:
                      Size.fromHeight(getProportionateScreenHeight(50)),
                  side: const BorderSide(
                    color: Colors.black45,
                  ),
                ),
                onPressed: () => pickDate(context),
                label: Text(
                  getDateText(),
                  style: const TextStyle(
                    color: Colors.black45,
                  ),
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(50)),
              child: DefaultInput(
                controller: widget.inversionInicialController,
                isContrasena: false,
                validacion: Validadores.validarValorMonetario,
                label: "Inversión inicial a revisar",
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(40)),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(30)),
              child: DefaultButton(
                func: () async => {
                  if (Validadores.validarNombreLargo(widget.nombreController.text) == null &&
                      Validadores.validarValorMonetario(widget.totalController.text) ==null &&
                      _dateTime != null &&
                      Validadores.validarValorMonetario(widget.inversionInicialController.text) == null){
                    debugPrint('${widget.nombreController.text} ${widget.totalController.text} ${_dateTime.month}/${_dateTime.day}/${_dateTime.year} ${widget.inversionInicialController.text}'),
                    await createNewGoal(),
                    debugPrint((goalId != null).toString()),
                    if (goalId != null){
                      AutoRouter.of(context).push(GoalSimulationRoute(goalId: goalId)),
                    }else{
                      showErrorSnack(context, 'Los datos ingresados no son válidos')
                    }
                  }
                },
                label: "Registrar",
                colorFondo: kPrimaryColor,
                colorTexto: kSecondaryColor,
              ),
            ),
          ],
        ));
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 10),
    );
    if (newDate == null) return;
    setState(() => _dateTime = newDate);
  }
}
