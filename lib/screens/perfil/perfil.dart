import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:zionapp/constants_config.dart';
import 'package:zionapp/components/cargando.dart';
import 'package:zionapp/screens/perfil/components/info.dart';
import 'package:zionapp/size_config.dart';

import 'components/boton_cambiar_contrasena.dart';
import 'components/foto.dart';

class PerfilHome extends StatefulWidget {
  @override
  _PerfilHomeState createState() => _PerfilHomeState();
}

class _PerfilHomeState extends State<PerfilHome> {
  bool loading = true;
  dynamic usuario;
  @override
  void initState() {
    _obtenerUsuario();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(
            "Mi Perfil",
            style: TextStyle(color: kPrimaryLightColor),
          ),
          backgroundColor: kSecondaryColor,
          centerTitle: true,
        ),
        body: !loading
            ? Column(children: [
                Flexible(
                    flex: 3,
                    child: FotoSection(
                      usuario,
                    )),
                Flexible(flex: 5, child: InfoPerfil(usuario)),
                Flexible(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(18)),
                      child: Container(
                        color: kPrimaryLightColor,
                        child: const BotonCambiarContrasena(),
                      ),
                    ))
              ])
            : Cargando());
  }

  Future<void> _obtenerUsuario() async {
    final String userString = await storage.read(key: "user");
    setState(() {
      usuario = json.decode(userString);
      loading = false;
    });
  }
}
