import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:zionapp/constants.dart';
import 'package:zionapp/components/button_default.dart';
import 'package:zionapp/components/input_default.dart';
import 'package:zionapp/models/tipo_banco.dart';
import 'package:zionapp/models/tipo_cuenta.dart';
import 'package:zionapp/size_config.dart';
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
  TipoBanco _tipoBancoSeleccionado;
  TipoCuenta _tipoCuentaSeleccionada;

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
                func: () => {
                  developer.log(
                      '${widget.titularController.text} ${widget.cedulaController.text} $_tipoBancoSeleccionado ${widget.numeroCuentaController.text} $_tipoCuentaSeleccionada')
                },
                label: "Registrar cuenta",
                colorFondo: kPrimaryColor,
                colorTexto: kSecondaryColor,
              ),
            ),
          ],
        ));
  }
}
