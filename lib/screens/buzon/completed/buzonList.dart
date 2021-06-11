import 'package:flutter/material.dart';
import 'package:zionApp/screens/buzon/completed/buzonCard.dart';
import 'package:zionApp/sizeConfig.dart';

class BuzonList extends StatelessWidget {
  dynamic noticias;
  BuzonList({this.noticias});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: noticias.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(top: getProportionateScreenHeight(10)),
          child: BuzonCard(
            noticia: noticias[index],
          ),
        );
      },
    );
  }
}
