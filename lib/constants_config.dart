import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const kPrimaryColor = Color(0xFFD0AF68);
const kSecondaryColor = Color(0xFF162034);
const kPrimaryLightColor = Color(0xFFFFFFFF);
const kDangerColor = Color(0xFFA81B1B);
const kDisableColor = Color(0xFFB1B1B1);
Map<int, Color> colorPrimary = {
  50:Color(0xFFD0AF68),
  100:Color(0xFFD0AF68),
  200:Color(0xFFD0AF68),
  300:Color(0xFFD0AF68),
  400:Color(0xFFD0AF68),
  500:Color(0xFFD0AF68),
  600:Color(0xFFD0AF68),
  700:Color(0xFFD0AF68),
  800:Color(0xFFD0AF68),
  900:Color(0xFFD0AF68),
  
};
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFECDF), Color(0xFF33BECA)],
);
const storage = FlutterSecureStorage();
const kAnimationDuration = Duration(milliseconds: 200);
const kAnimationMiliseconds = 500;
const kapiUrl =
    "http://35.224.191.131:3000/v1/api"; //No poner ip 127.0.0.1 ni localhost
const apiKeyToken =
    "42c05414538d7fe7f49bb2594849739795dc9fbdda41ce23076a9594edcd6567";
const fondos = {
  "alpha": {
    "titulo": "Alpha",
    "imagen": "assets/img/alpha.png",
    "banner": "assets/img/inversion_alpha_banner.PNG",
    "info_general":
        "El Fondo Alpha es una excelente alternativa de ahorro que resulta atractiva para inversionistas conservadores, porque ofrece más rentabilidad que una cuenta de ahorros y mayor disponibilidad del dinero que un certificado o depósito a plazo.",
    "inversion_inicial": "\$ 100,00",
    "ren_promedio": "4,91 %",
    "monto_minimo": "\$ 20,00",
    "min_permanencia": "32 dias habiles",
    "plz_retiros": "48 hrs",
    "perfil_inv": [
      {
        "icon": Icons.account_balance,
        "descripcion":
            "Relación Riesgo-Rentabilidad orientada a la preservación del Capital"
      },
      {
        "icon": Icons.bolt,
        "descripcion": "Objetivo al invertir: Ahorro a corto plazo"
      },
      {
        "icon": Icons.delivery_dining,
        "descripcion":
            "Capacidad de ahorro moderada, o requerimiento de liquidez a corto plazo"
      },
      {
        "icon": Icons.attach_money_rounded,
        "descripcion": "Empresas que deseen obtener ganancias de su dinero"
      },
    ]
  },
  "omega": {
    "titulo": "Omega",
    "imagen": "assets/img/omega.png",
    "banner": "assets/img/inversion_omega_banner.PNG",
    "info_general":
        "El Fondo Omega es la mejor opción para quienes desean hacer crecer su Patrimonio en el tiempo. Puedes invertir tus ahorros o excedentes de liquidez y así planificar objetivos a mediano y largo plazo tales como educación, jubilación o vivienda propia.",
    "inversion_inicial": "\$ 100,00",
    "ren_promedio": "6,08 %",
    "monto_minimo": "\$ 20,00",
    "min_permanencia": "32 dias habiles",
    "plz_retiros": "48 hrs",
    "perfil_inv": [
      {
        "icon": Icons.attach_money_rounded,
        "descripcion":
            "Relación Riesgo- Rentabilidad orientada al crecimiento o apreciación del Capital"
      },
      {
        "icon": Icons.ac_unit,
        "descripcion":
            "Objetivo de la inversión: ingresos superiores a los que podría obtener en un Certificado de Depósito a plazo o Póliza de Acumulación"
      },
      {
        "icon": Icons.ac_unit,
        "descripcion":
            "Perspectiva de cumplir con metas de mediano a plazo, lograr acumular capital para proyectos u objetivos (como educación, viajes, adquisición de bienes, etc.) que se hayan propuesto conseguir en el tiempo."
      },
      {
        "icon": Icons.ac_unit,
        "descripcion":
            "Capacidad de Inversión media o alta, sin proyectarse a requerir el capital invertido próximamente."
      },
    ]
  }
};
