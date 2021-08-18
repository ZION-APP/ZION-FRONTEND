import 'dart:developer' as developer;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:zionapp/constants_config.dart';
import 'package:zionapp/components/button_default.dart';
import 'package:zionapp/components/input_default.dart';
import 'package:zionapp/models/tipo_banco.dart';
import 'package:zionapp/models/tipo_cuenta.dart';
import 'package:zionapp/validator/validator.dart';

// ignore: must_be_immutable
class FormularioCuentaBancaria extends StatefulWidget {
  TextEditingController titularController;
  TextEditingController cedulaController;
  TipoBanco tipoBanco;
  TextEditingController numeroCuentaController;
  TipoCuenta tipoCuenta;
  GlobalKey<FormState> formKey;

  FormularioCuentaBancaria(
      {this.titularController,
      this.cedulaController,
      this.tipoBanco,
      this.numeroCuentaController,
      this.tipoCuenta,
      this.formKey});

  @override
  _FormularioCuentaBancariaState createState() =>
      _FormularioCuentaBancariaState();
}

class _FormularioCuentaBancariaState extends State<FormularioCuentaBancaria> {
  int accountId;
  TipoBanco _tipoBancoSeleccionado;
  TipoCuenta _tipoCuentaSeleccionada;

  Future<void> createNewAccount() async {
    accountId = null;
    int bankNumber;
    int accTypeNumber;
    switch (_tipoBancoSeleccionado) {
      case TipoBanco.BancoGuayaquil:
        bankNumber = 3;
        break;
      case TipoBanco.BancoPacifico:
        bankNumber = 1;
        break;
      case TipoBanco.BancoProdubanco:
        bankNumber = 5;
        break;
      default:
        bankNumber = 0;
    }
    switch (_tipoCuentaSeleccionada) {
      case TipoCuenta.CuentaAhorro:
        accTypeNumber = 1;
        break;
      case TipoCuenta.CuentaCorriente:
        accTypeNumber = 2;
        break;
      default:
    }
    try {
      final String token = await storage.read(key: 'token');
      final Response response = await dioClient.post('$kapiUrl/bank_accounts/me', 
                                      options: Options(headers: {'Authorization': token}),
                                      data: {
                                        'owner_name':widget.titularController.text,
                                        'identity_number':widget.cedulaController.text,
                                        'number_account':widget.numeroCuentaController.text,
                                        'financial_entity_id':bankNumber,
                                        'bank_account_type_id':accTypeNumber
                                      });
      setState(() {
        accountId = response.data['id'] as int;
      });
      debugPrint(response.data.toString());
      widget.titularController.clear();
      widget.cedulaController.clear();
      widget.numeroCuentaController.clear();
      setState(() {
        _tipoBancoSeleccionado = null;
        _tipoCuentaSeleccionada = null;
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
            SizedBox(height: getProportionateScreenHeight(25)),
            const Text("Ingrese la información de su cuenta bancaria"),
            SizedBox(height: getProportionateScreenHeight(25)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(50)),
              child: DefaultInput(
                controller: widget.titularController,
                isContrasena: false,
                validacion: Validadores.validarNombreLargo,
                label: "Nombre completo del titular",
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(25)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(50)),
              child: DefaultInput(
                controller: widget.cedulaController,
                isContrasena: false,
                validacion: Validadores.validarCedula,
                label: "Número de cédula/RUC",
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(25)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(50)),
              child: DropdownButtonFormField(
                key: const Key('TipoBanco'),
                  hint: const Text('Tipo de banco'),
                  value: _tipoBancoSeleccionado,
                  items: const [
                    DropdownMenuItem(
                      value: TipoBanco.BancoPacifico,
                      child: Text("Banco Pacífico"),
                    ),
                    DropdownMenuItem(
                      value: TipoBanco.BancoGuayaquil,
                      child: Text("Banco Guayaquil"),
                    ),
                    DropdownMenuItem(
                      value: TipoBanco.BancoProdubanco,
                      child: Text("Produbanco"),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _tipoBancoSeleccionado = value as TipoBanco;
                      widget.tipoBanco = _tipoBancoSeleccionado;
                    });
                  }),
            ),
            SizedBox(height: getProportionateScreenHeight(25)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(50)),
              child: DefaultInput(
                controller: widget.numeroCuentaController,
                isContrasena: false,
                validacion: (numCuenta) {
                  return Validadores.validarNumCuenta(
                      numCuenta as String, _tipoBancoSeleccionado);
                },
                label: "Número de la cuenta",
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(25)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(50)),
              child: DropdownButtonFormField(
                key: const Key('TipoCuenta'),
                  hint: const Text('Tipo de cuenta'),
                  value: _tipoCuentaSeleccionada,
                  items: const [
                    DropdownMenuItem(
                      value: TipoCuenta.CuentaAhorro,
                      child: Text("Cuenta de ahorros"),
                    ),
                    DropdownMenuItem(
                      value: TipoCuenta.CuentaCorriente,
                      child: Text("Cuenta corriente"),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _tipoCuentaSeleccionada = value as TipoCuenta;
                      widget.tipoCuenta = _tipoCuentaSeleccionada;
                    });
                  }),
            ),
            SizedBox(height: getProportionateScreenHeight(25)),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(30)),
              child: DefaultButton(
                func: () async => {
                  developer.log(
                      '${widget.titularController.text} ${widget.cedulaController.text} $_tipoBancoSeleccionado ${widget.numeroCuentaController.text} $_tipoCuentaSeleccionada'),
                  await createNewAccount(),
                  debugPrint((accountId != null).toString()),
                  if (accountId != null){
                    Navigator.pop(context, accountId),
                  }else{
                    showErrorSnack(context, 'Los datos ingresados no son válidos')
                  }
                },
                label: "Registrar cuenta",
                colorFondo: kPrimaryColor,
                colorTexto: kSecondaryColor,
              ),
            ),
          ],
        ));
  }

  double getProportionateScreenWidth(double input) {
    return MediaQuery.of(context).size.width * (input/375);
  }

  double getProportionateScreenHeight(double input) {
    return MediaQuery.of(context).size.height * (input/812);
  }
}
