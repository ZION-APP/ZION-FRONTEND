import 'package:zionapp/constants_config.dart';
import 'package:zionapp/models/tipo_banco.dart';
import 'package:zionapp/models/tipo_cuenta.dart';
import 'package:zionapp/screens/cuenta_bancaria/components.dart/formulario.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CuentaBancaria extends StatefulWidget {
  final bool isUpdateForm;
  final int bankAccountId;
  const CuentaBancaria({Key key, @required this.isUpdateForm, this.bankAccountId}) : super(key: key);

  @override
  _CuentaBancariaState createState() => _CuentaBancariaState();
}

class _CuentaBancariaState extends State<CuentaBancaria> {
  final _formKey = GlobalKey<FormState>();
  final titularController = TextEditingController();
  final cedulaController = TextEditingController();
  TipoBanco tipoBanco;
  final numeroCuentaController = TextEditingController();
  TipoCuenta tipoCuenta;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: kPrimaryLightColor,
        ),
        title: const Text(
          'Cuenta Bancaria',
          style: TextStyle(color: kPrimaryLightColor),
        ),
        centerTitle: true,
        backgroundColor: kSecondaryColor,
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
              hasScrollBody: false,
              child: FormularioCuentaBancaria(
                bankAccountId: widget.bankAccountId,
                isUpdateForm: widget.isUpdateForm,
                titularController: titularController,
                cedulaController: cedulaController,
                tipoBanco: tipoBanco,
                numeroCuentaController: numeroCuentaController,
                tipoCuenta: tipoCuenta,
                formKey: _formKey,
              )),
        ],
      ),
    );
  }
}
