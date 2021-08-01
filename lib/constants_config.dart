import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const kPrimaryColor = Color(0xFFD0AF68);
const kSecondaryColor = Color(0xFF162034);
const kPrimaryLightColor = Color(0xFFFFFFFF);
const kDangerColor = Color(0xFFA81B1B);
const kDisableColor = Color(0xFFB1B1B1);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFECDF), Color(0xFF33BECA)],
);
const storage = FlutterSecureStorage();
const kAnimationDuration = Duration(milliseconds: 200);
const kAnimationMiliseconds = 500;
const kapiUrl =
    "http://api.practical.com.ec/residente"; //No poner ip 127.0.0.1 ni localhost

const fondos = {
  "alpha": {
    "titulo": "Alpha",
    "imagen": "assets/img/alpha.png",
    "info_general":
        "El Fondo Alpha es una excelente alternativa de ahorro que resulta atractiva para inversionistas conservadores, porque ofrece más rentabilidad que una cuenta de ahorros y mayor disponibilidad del dinero que un certificado o depósito a plazo.",
    "inversion_inicial": "\$ 100,00",
    "monto_minimo": "\$ 20,00",
    "min_permanecia": "32 dias habiles",
    "plz_retiros": "48 hrs",
  },
  "omega": {
    "titulo": "Omega",
    "imagen": "assets/img/omega.png",
    "info_general":
        "El Fondo Omega es la mejor opción para quienes desean hacer crecer su Patrimonio en el tiempo. Puedes invertir tus ahorros o excedentes de liquidez y así planificar objetivos a mediano y largo plazo tales como educación, jubilación o vivienda propia.",
    "inversion_inicial": "\$ 100",
    "monto_minimo": "\$ 20,00",
    "min_permanencia": "32 dias habiles",
    "plz_retiros": "48 hrs",
  }
};
