import 'package:flutter/material.dart';
import 'package:zionApp/Constants.dart';

import 'package:zionApp/components/expansion_panelcomp.dart';
import 'package:zionApp/sizeConfig.dart';

class PreguntasF extends StatelessWidget {
  PreguntasF({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kPrimaryLightColor,
        ),
        title: Text(
          'Preguntas Frecuentes ',
          style: TextStyle(color: kPrimaryLightColor),
        ),
        centerTitle: true,
        backgroundColor: kSecondaryColor,
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: ExpandingItems(),
      ),
    );
  }
}
