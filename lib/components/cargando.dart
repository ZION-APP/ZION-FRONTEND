import 'package:flutter/material.dart';
import 'package:zionApp/Constants.dart';

class Cargando extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: kPrimaryColor,
      ),
    );
  }
}
