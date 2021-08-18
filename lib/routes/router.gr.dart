// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
<<<<<<< HEAD
import 'package:flutter/material.dart' as _i17;
=======
import 'package:flutter/material.dart' as _i15;
>>>>>>> origin/Goal-creation-branch

import '../screens/alicuotas/alicuota.dart' as _i4;
import '../screens/contactanos/contactanos.dart' as _i9;
import '../screens/crear_fondo/crear_fondo.dart' as _i15;
import '../screens/cuenta_bancaria/cuenta_bancaria.dart' as _i11;
import '../screens/formulario/formulario.dart' as _i16;
import '../screens/goal_creation/goal_creation.dart' as _i12;
import '../screens/goal_creation/goal_list.dart' as _i14;
import '../screens/goal_creation/goal_simulation.dart' as _i13;
import '../screens/home/home.dart' as _i3;
import '../screens/informacion/informacion.dart' as _i7;
import '../screens/login/login.dart' as _i2;
import '../screens/menu/menu.dart' as _i6;
import '../screens/misionyvision/misionyvision.dart' as _i8;
import '../screens/perfil/perfil.dart' as _i5;
import '../screens/register/register.dart' as _i10;
import '../screens/reglamentos/reglamento.dart' as _i14;
import '../screens/tipos_fondo/info_fondo.dart' as _i13;

class AppRouter extends _i1.RootStackRouter {
  AppRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    LoginRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: const _i2.Login());
    },
    HomeRoute.name: (entry) {
<<<<<<< HEAD
      var args =
          entry.routeData.argsAs<HomeRouteArgs>(orElse: () => HomeRouteArgs());
=======
      final args =
          entry.routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
>>>>>>> origin/Goal-creation-branch
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
    },
<<<<<<< HEAD
    InfoFondoRoute.name: (entry) {
      var pathParams = entry.routeData.pathParams;
      var args = entry.routeData.argsAs<InfoFondoRouteArgs>(
          orElse: () => InfoFondoRouteArgs(tipo: pathParams.getString('tipo')));
      return _i1.MaterialPageX(
          entry: entry, child: _i13.InfoFondo(key: args.key, tipo: args.tipo));
    },
    ReglamentoRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: const _i14.Reglamento());
    },
    CreacionFondoRoute.name: (entry) {
      var args = entry.routeData.argsAs<CreacionFondoRouteArgs>(
          orElse: () => CreacionFondoRouteArgs());
      return _i1.MaterialPageX(
          entry: entry,
          child: _i15.CreacionFondo(tipo: args.tipo, key: args.key));
    },
    FormularioRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: const _i16.Formulario());
=======
    GoalSimulationRoute.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry, child: const _i13.GoalSimulation());
    },
    GoalListRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: const _i14.GoalList());
>>>>>>> origin/Goal-creation-branch
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
        _i1.RouteConfig(GoalCreationRoute.name, path: '/goalcreation'),
<<<<<<< HEAD
        _i1.RouteConfig(InfoFondoRoute.name, path: '/info-fondo/:tipo'),
        _i1.RouteConfig(ReglamentoRoute.name, path: '/reglamentos'),
        _i1.RouteConfig(CreacionFondoRoute.name, path: '/crear-fondo'),
        _i1.RouteConfig(FormularioRoute.name, path: '/formulario')
=======
        _i1.RouteConfig(GoalSimulationRoute.name, path: '/goalsimulation'),
        _i1.RouteConfig(GoalListRoute.name, path: '/goallist')
>>>>>>> origin/Goal-creation-branch
      ];
}

class LoginRoute extends _i1.PageRouteInfo {
  const LoginRoute() : super(name, path: '/');

  static const String name = 'LoginRoute';
}

class HomeRoute extends _i1.PageRouteInfo<HomeRouteArgs> {
<<<<<<< HEAD
  HomeRoute({_i17.Key key, String titulo})
=======
  HomeRoute({_i15.Key key, String titulo})
>>>>>>> origin/Goal-creation-branch
      : super(name,
            path: '/home', args: HomeRouteArgs(key: key, titulo: titulo));

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key, this.titulo});

<<<<<<< HEAD
  final _i17.Key key;
=======
  final _i15.Key key;
>>>>>>> origin/Goal-creation-branch

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

<<<<<<< HEAD
class InfoFondoRoute extends _i1.PageRouteInfo<InfoFondoRouteArgs> {
  InfoFondoRoute({_i17.Key key, String tipo})
      : super(name,
            path: '/info-fondo/:tipo',
            args: InfoFondoRouteArgs(key: key, tipo: tipo),
            params: {'tipo': tipo});

  static const String name = 'InfoFondoRoute';
}

class InfoFondoRouteArgs {
  const InfoFondoRouteArgs({this.key, this.tipo});

  final _i17.Key key;

  final String tipo;
}

class ReglamentoRoute extends _i1.PageRouteInfo {
  const ReglamentoRoute() : super(name, path: '/reglamentos');

  static const String name = 'ReglamentoRoute';
}

class CreacionFondoRoute extends _i1.PageRouteInfo<CreacionFondoRouteArgs> {
  CreacionFondoRoute({String tipo, _i17.Key key})
      : super(name,
            path: '/crear-fondo',
            args: CreacionFondoRouteArgs(tipo: tipo, key: key));

  static const String name = 'CreacionFondoRoute';
}

class CreacionFondoRouteArgs {
  const CreacionFondoRouteArgs({this.tipo, this.key});

  final String tipo;

  final _i17.Key key;
}

class FormularioRoute extends _i1.PageRouteInfo {
  const FormularioRoute() : super(name, path: '/formulario');

  static const String name = 'FormularioRoute';
=======
class GoalSimulationRoute extends _i1.PageRouteInfo {
  const GoalSimulationRoute() : super(name, path: '/goalsimulation');

  static const String name = 'GoalSimulationRoute';
}

class GoalListRoute extends _i1.PageRouteInfo {
  const GoalListRoute() : super(name, path: '/goallist');

  static const String name = 'GoalListRoute';
>>>>>>> origin/Goal-creation-branch
}
