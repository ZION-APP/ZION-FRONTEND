import 'package:flutter/material.dart';
import 'package:zionapp/screens/buzon/completed/buzon_card.dart';
import 'package:zionapp/size_config.dart';

class BuzonList extends StatelessWidget {
  final dynamic noticias;
  const BuzonList({this.noticias});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: noticias.length as int,
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
