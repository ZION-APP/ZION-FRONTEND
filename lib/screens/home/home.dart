import 'package:flutter/material.dart';
import 'package:zionapp/constants_config.dart';
import 'package:zionapp/screens/alicuotas/alicuota.dart';
import 'package:zionapp/screens/aportes/aportes.dart';
//import 'package:zionapp/screens/buzon/buzon.dart';
import 'package:zionapp/screens/goal_creation/goal_creation.dart';
import 'package:zionapp/screens/inversiones/inversiones.dart';
import 'package:zionapp/screens/menu/menu.dart';

class Home extends StatefulWidget {
  final String titulo;
  const Home({Key key, @required this.titulo}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> _titulos = [
    "Metas",
    "Aportes",
    "Inversiones",
    "Configuración"
  ];

  final List<Widget> _screens = [
    //const BuzonHome(), ¿Hay que remover buzon?
    const GoalCreation(),
    const Aporte(),
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
          style: const TextStyle(color: kPrimaryLightColor),
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
          BottomNavigationBarItem(
              icon: const Icon(Icons.home), label: _titulos[0]),
          BottomNavigationBarItem(
              icon: const Icon(Icons.monetization_on), label: _titulos[1]),
          BottomNavigationBarItem(
              icon: const Icon(Icons.person), label: _titulos[2]),
          BottomNavigationBarItem(
              icon: const Icon(Icons.menu), label: _titulos[3]),
        ]);
  }

  void _navigationHandler(int newPage) {
    setState(() {
      page = newPage;
    });
  }
}
