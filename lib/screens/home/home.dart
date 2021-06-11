import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zionApp/Constants.dart';
import 'package:zionApp/bloc/auth/authBloc.dart';
import 'package:zionApp/bloc/auth/authEvent.dart';
import 'package:zionApp/screens/alicuotas/alicuota.dart';
import 'package:zionApp/screens/buzon/buzon.dart';
import 'package:zionApp/screens/menu/menu.dart';
import 'package:zionApp/screens/perfil/perfil.dart';

class Home extends StatefulWidget {
  final String titulo;
  Home({Key key, @required this.titulo}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> _screens = [
    BuzonHome(),
    AlicuotaHome(),
    PerfilHome(),
    MenuHome()
  ];
  int page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titulo),
      ),
      body: _screens[page],
      bottomNavigationBar: _navigationBar(),
    );
  }

  Widget _navigationBar() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kPrimaryColor,
        showSelectedLabels: false,
        showUnselectedLabels: true,
        currentIndex: page,
        onTap: _navigationHandler,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on), label: "Alicuotas"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
        ]);
  }

  void _navigationHandler(int newPage) {
    setState(() {
      page = newPage;
    });
  }

  void _cerrarSesion() {
    BlocProvider.of<LogInBloc>(context).add(CerrarSesion(context));
  }
}
