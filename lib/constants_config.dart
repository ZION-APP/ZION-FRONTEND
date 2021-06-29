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
