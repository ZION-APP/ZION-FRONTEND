import 'package:flutter/material.dart';
import 'package:zionApp/Constants.dart';
import 'package:zionApp/components/input_default.dart';
import 'package:zionApp/models/tipoPersona.dart';
import 'package:zionApp/sizeConfig.dart';
import 'package:zionApp/validator/validator.dart';

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
     this.contrasenaConfirmController});

  @override
  _FormularioRegisterState createState() => _FormularioRegisterState();
}

class _FormularioRegisterState extends State<FormularioRegister> {
  TipoPersona _tipoSeleccionado;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(50)),
                child: DefaultInput(
                  controller: widget.usuarioController,
                  isContrasena: false,
                  //validacion: Validadores.validarUsername,
                  label: "Nombre de usuario",
                ),
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(25)),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(50)),
                child: DefaultInput(
                  controller: widget.cedulaController,
                  isContrasena: false,
                  //validacion: Validadores.validarCedula,
                  label: "Cédula/RUC",
                ),
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(25)),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(50)),
                child: DropdownButtonFormField(
                  hint: Text('Tipo de persona'),
                  value: _tipoSeleccionado,
                  items: [
                    DropdownMenuItem(
                      child: Text("Persona Natural"),
                      value: TipoPersona.PersonaNatural,
                    ),
                    DropdownMenuItem(
                      child: Text("Persona Jurídica"),
                      value: TipoPersona.PersonaJuridica,
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _tipoSeleccionado = value;
                    });
                  }
                ),
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(25)),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(50)),
                child: DefaultInput(
                  controller: widget.correoController,
                  isContrasena: false,
                  //validacion: Validadores.validarCorreo,
                  label: "Correo electrónico",
                ),
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(25)),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(50)),
                child: DefaultInput(
                  controller: widget.contrasenaController,
                  isContrasena: true,
                  validacion: Validadores.validarContrasena,
                  label: "Contraseña",
                ),
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(25)),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(50)),
                child: DefaultInput(
                  controller: widget.contrasenaConfirmController,
                  isContrasena: true,
                  validacion: Validadores.validarContrasena,
                  label: "Confirmar contraseña",
                ),
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(25)),
        ]
      ),
    );
  }
}