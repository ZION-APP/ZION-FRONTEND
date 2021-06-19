import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zionApp/Constants.dart';
import 'package:zionApp/bloc/auth/authBloc.dart';
import 'package:zionApp/bloc/auth/authEvent.dart';
import 'package:zionApp/screens/alicuotas/alicuota.dart';
import 'package:zionApp/screens/buzon/buzon.dart';
import 'package:zionApp/screens/inversiones/inversiones.dart';
import 'package:zionApp/screens/menu/menu.dart';
import 'package:zionApp/screens/perfil/perfil.dart';

class Home extends StatefulWidget {
  final String titulo;
  Home({Key key, @required this.titulo}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> _titulos = ["Metas", "Aportes", "Inversiones", "Configuración"];

  List<Widget> _screens = [
    BuzonHome(),
    AlicuotaHome(),
    InversionesHome(),
    MenuHome()
  ];
  int page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titulos[page],
          style: TextStyle(color: kPrimaryLightColor),
        ),
        backgroundColor: kSecondaryColor,
      ),
      body: _screens[page],
      bottomNavigationBar: _navigationBar(),
    );
  }

  Widget _navigationBar() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kPrimaryColor,
        showUnselectedLabels: true,
        currentIndex: page,
        onTap: _navigationHandler,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: _titulos[0]),
          BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on), label: _titulos[1]),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: _titulos[2]),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: _titulos[3]),
        ]);
  }

  void _navigationHandler(int newPage) {
    setState(() {
      page = newPage;
    });
  }
}
