import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zionapp/routes/router.gr.dart';

class InversionesHome extends StatefulWidget {
  @override
  _InversionesState createState() => _InversionesState();
}

class _InversionesState extends State<InversionesHome> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                AutoRouter.of(context).push(InfoFondoRoute(tipo: "alpha"));
              },
              child: const Text("Alfa")),
          TextButton(
              onPressed: () {
                AutoRouter.of(context).push(InfoFondoRoute(tipo: "omega"));
              },
              child: const Text("Omega"))
        ],
      ),
    );
  }
}
