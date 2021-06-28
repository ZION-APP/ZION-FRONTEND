// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i13;

import '../screens/alicuotas/alicuota.dart' as _i4;
import '../screens/contactanos/contactanos.dart' as _i9;
import '../screens/cuenta_bancaria/cuenta_bancaria.dart' as _i11;
import '../screens/goal_creation/goal_creation.dart' as _i12;
import '../screens/home/home.dart' as _i3;
import '../screens/informacion/informacion.dart' as _i7;
import '../screens/login/login.dart' as _i2;
import '../screens/menu/menu.dart' as _i6;
import '../screens/misionyvision/misionyvision.dart' as _i8;
import '../screens/perfil/perfil.dart' as _i5;
import '../screens/register/register.dart' as _i10;

class AppRouter extends _i1.RootStackRouter {
  AppRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    LoginRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: const _i2.Login());
    },
    HomeRoute.name: (entry) {
      var args =
          entry.routeData.argsAs<HomeRouteArgs>(orElse: () => HomeRouteArgs());
      return _i1.MaterialPageX(
          entry: entry, child: _i3.Home(key: args.key, titulo: args.titulo));
    },
    AlicuotaHomeRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: const _i4.AlicuotaHome());
    },
    PerfilHomeRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i5.PerfilHome());
    },
    MenuHomeRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i6.MenuHome());
    },
    InformacionRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: const _i7.Informacion());
    },
    VisionyMisionRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: const _i8.VisionyMision());
    },
    ContactanosRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: const _i9.Contactanos());
    },
    RegisterRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: const _i10.Register());
    },
    CuentaBancariaRoute.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry, child: const _i11.CuentaBancaria());
    },
    GoalCreationRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: const _i12.GoalCreation());
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(LoginRoute.name, path: '/'),
        _i1.RouteConfig(HomeRoute.name, path: '/home'),
        _i1.RouteConfig(AlicuotaHomeRoute.name, path: '/alicuotas'),
        _i1.RouteConfig(PerfilHomeRoute.name, path: '/perfil'),
        _i1.RouteConfig(MenuHomeRoute.name, path: '/menu'),
        _i1.RouteConfig(InformacionRoute.name, path: '/informacion'),
        _i1.RouteConfig(VisionyMisionRoute.name, path: '/misionyvision'),
        _i1.RouteConfig(ContactanosRoute.name, path: '/contactanos'),
        _i1.RouteConfig(RegisterRoute.name, path: '/register'),
        _i1.RouteConfig(CuentaBancariaRoute.name, path: '/cuenta_bancaria'),
        _i1.RouteConfig(GoalCreationRoute.name, path: '/goalcreation')
      ];
}

class LoginRoute extends _i1.PageRouteInfo {
  const LoginRoute() : super(name, path: '/');

  static const String name = 'LoginRoute';
}

class HomeRoute extends _i1.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i13.Key key, String titulo})
      : super(name,
            path: '/home', args: HomeRouteArgs(key: key, titulo: titulo));

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key, this.titulo});

  final _i13.Key key;

  final String titulo;
}

class AlicuotaHomeRoute extends _i1.PageRouteInfo {
  const AlicuotaHomeRoute() : super(name, path: '/alicuotas');

  static const String name = 'AlicuotaHomeRoute';
}

class PerfilHomeRoute extends _i1.PageRouteInfo {
  const PerfilHomeRoute() : super(name, path: '/perfil');

  static const String name = 'PerfilHomeRoute';
}

class MenuHomeRoute extends _i1.PageRouteInfo {
  const MenuHomeRoute() : super(name, path: '/menu');

  static const String name = 'MenuHomeRoute';
}

class InformacionRoute extends _i1.PageRouteInfo {
  const InformacionRoute() : super(name, path: '/informacion');

  static const String name = 'InformacionRoute';
}

class VisionyMisionRoute extends _i1.PageRouteInfo {
  const VisionyMisionRoute() : super(name, path: '/misionyvision');

  static const String name = 'VisionyMisionRoute';
}

class ContactanosRoute extends _i1.PageRouteInfo {
  const ContactanosRoute() : super(name, path: '/contactanos');

  static const String name = 'ContactanosRoute';
}

class RegisterRoute extends _i1.PageRouteInfo {
  const RegisterRoute() : super(name, path: '/register');

  static const String name = 'RegisterRoute';
}

class CuentaBancariaRoute extends _i1.PageRouteInfo {
  const CuentaBancariaRoute() : super(name, path: '/cuenta_bancaria');

  static const String name = 'CuentaBancariaRoute';
}

class GoalCreationRoute extends _i1.PageRouteInfo {
  const GoalCreationRoute() : super(name, path: '/goalcreation');

  static const String name = 'GoalCreationRoute';
}
