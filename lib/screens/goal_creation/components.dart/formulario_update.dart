import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:zionapp/components/button_default.dart';
import 'package:zionapp/components/input_default.dart';
import 'package:zionapp/validator/validator.dart';
import '../../../constants_config.dart';

// ignore: must_be_immutable
class FormularioGoalUpdate extends StatefulWidget {
  int goalId;
  TextEditingController nombreController;
  TextEditingController currentAmountController;
  GlobalKey<FormState> formKey;

  FormularioGoalUpdate(
      {this.goalId,
      this.nombreController,
      this.currentAmountController,
      this.formKey});

  @override
  _FormularioGoalUpdateState createState() => _FormularioGoalUpdateState();
}

class _FormularioGoalUpdateState extends State<FormularioGoalUpdate> {
  bool isSuccessful;

  Future<void> updateGoal() async {
    setState(() {
      isSuccessful = false;
    });
    try {
      final String token = await storage.read(key: 'token');
      final int currentAmount = int.parse(widget.currentAmountController.text);
      debugPrint(currentAmount.toString());
      // ignore: unused_local_variable
      final Response response = await dioClient.put(
          '$kapiUrl/goals/me/${widget.goalId}',
          options: Options(headers: {'Authorization': token}),
          data: {
            'name': widget.nombreController.text,
            'current_amount': widget.currentAmountController.text,
            'status': 'active'
          });
      widget.nombreController.clear();
      widget.currentAmountController.clear();
      setState(() {
        isSuccessful = true;
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
              'Actualización de una Meta',
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
                controller: widget.currentAmountController,
                isContrasena: false,
                validacion: Validadores.validarValorMonetario,
                label: "Dinero actual en la meta",
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(40)),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(30)),
              child: DefaultButton(
                func: () async => {
                  if (Validadores.validarNombreLargo(
                              widget.nombreController.text) ==
                          null &&
                      Validadores.validarValorMonetario(
                              widget.currentAmountController.text) ==
                          null)
                    {
                      debugPrint(
                          '${widget.nombreController.text} ${widget.currentAmountController.text}'),
                      await updateGoal(),
                      debugPrint(isSuccessful.toString()),
                      if (isSuccessful)
                        {
                          Navigator.pop(context, widget.goalId),
                        }
                      else
                        {
                          showErrorSnack(
                              context, 'Los datos ingresados no son válidos')
                        }
                    }
                },
                label: "Actualizar",
                colorFondo: kPrimaryColor,
                colorTexto: kSecondaryColor,
              ),
            ),
          ],
        ));
  }

  double getProportionateScreenWidth(double input) {
    return MediaQuery.of(context).size.width * (input / 375);
  }

  double getProportionateScreenHeight(double input) {
    return MediaQuery.of(context).size.height * (input / 812);
  }
}
