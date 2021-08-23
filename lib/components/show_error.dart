import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zionapp/constants_config.dart';

void showError(String error, BuildContext context) {
  final snackBar = SnackBar(
    content: Text(
      error,
      textAlign: TextAlign.center,
    ),
    backgroundColor: kDangerColor,
    duration: const Duration(milliseconds: 1500),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
