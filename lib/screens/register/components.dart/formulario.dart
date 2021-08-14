import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:zionapp/constants_config.dart';
import 'package:zionapp/components/button_default.dart';
import 'package:zionapp/components/input_default.dart';
import 'package:zionapp/models/tipo_persona.dart';
import 'package:zionapp/size_config.dart';
import 'package:zionapp/validator/validator.dart';

// ignore: must_be_immutable
class FormularioRegister extends StatefulWidget {
  TextEditingController usuarioController;
  TextEditingController cedulaController;
  TipoPersona tipoPersona;
  TextEditingController correoController;
  TextEditingController contrasenaController;
  TextEditingController contrasenaConfirmController;
  GlobalKey<FormState> formKey;

  FormularioRegister(
      {this.usuarioController,
      this.cedulaController,
      this.tipoPersona,
      this.correoController,
      this.contrasenaController,
      this.contrasenaConfirmController,
      this.formKey});

  @override
  _FormularioRegisterState createState() => _FormularioRegisterState();
}

class _FormularioRegisterState extends State<FormularioRegister> {
  TipoPersona _tipoSeleccionado;

  bool validateForm() {
    if (Validadores.validarUsername(widget.usuarioController.text) == null &&
        Validadores.validarCedula(widget.cedulaController.text) == null &&
        _tipoSeleccionado != null &&
        Validadores.validarCorreo(widget.correoController.text) == null &&
        Validadores.validarContrasena(widget.contrasenaController.text) ==
            null &&
        widget.contrasenaConfirmController.text
                .compareTo(widget.contrasenaController.text) ==
            0) {
      return true;
    } else {
      return false;
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
      child: Column(children: [
        SizedBox(height: getProportionateScreenHeight(40)),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(50)),
          child: DefaultInput(
            controller: widget.usuarioController,
            isContrasena: false,
            validacion: Validadores.validarUsername,
            label: "Nombre de usuario",
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(25)),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(50)),
          child: DefaultInput(
            controller: widget.cedulaController,
            isContrasena: false,
            validacion: Validadores.validarCedula,
            label: "Cédula/RUC",
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(25)),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(50)),
          child: DropdownButtonFormField(
              hint: const Text('Tipo de persona'),
              value: _tipoSeleccionado,
              items: const [
                DropdownMenuItem(
                  value: TipoPersona.PersonaNatural,
                  child: Text("Persona Natural"),
                ),
                DropdownMenuItem(
                  value: TipoPersona.PersonaJuridica,
                  child: Text("Persona Jurídica"),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _tipoSeleccionado = value as TipoPersona;
                  widget.tipoPersona = _tipoSeleccionado;
                });
              }),
        ),
        SizedBox(height: getProportionateScreenHeight(25)),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(50)),
          child: DefaultInput(
            controller: widget.correoController,
            isContrasena: false,
            validacion: Validadores.validarCorreo,
            label: "Correo electrónico",
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(25)),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(50)),
          child: DefaultInput(
            controller: widget.contrasenaController,
            isContrasena: true,
            validacion: Validadores.validarContrasena,
            label: "Contraseña",
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(25)),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(50)),
          child: DefaultInput(
            controller: widget.contrasenaConfirmController,
            isContrasena: true,
            validacion: (confContrasena) {
              if (confContrasena.compareTo(widget.contrasenaController.text) !=
                  0) {
                return "Ingrese la misma contraseña";
              }
            },
            label: "Confirmar contraseña",
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(25)),
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenHeight(30)),
          child: DefaultButton(
            func: () => {
              if (validateForm())
                {
                  developer.log(
                      '${widget.usuarioController.text} ${widget.cedulaController.text} $_tipoSeleccionado ${widget.correoController.text} ${widget.contrasenaController.text} ${widget.contrasenaConfirmController.text}')
                }
              else
                {showErrorSnack(context, 'Los datos ingresados no son válidos')}
            },
            label: "Registrar cuenta",
            colorFondo: kPrimaryColor,
            colorTexto: kSecondaryColor,
          ),
        ),
      ]),
    );
  }
}