// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i21;

import '../screens/alicuotas/alicuota.dart' as _i4;
import '../screens/contactanos/contactanos.dart' as _i9;
import '../screens/crear_fondo/crear_fondo.dart' as _i17;
import '../screens/cuenta_bancaria/cuenta_bancaria.dart' as _i11;
import '../screens/cuenta_bancaria/cuenta_bancaria_list.dart' as _i19;
import '../screens/formulario/formulario.dart' as _i18;
import '../screens/goal_creation/goal_creation.dart' as _i12;
import '../screens/goal_creation/goal_list.dart' as _i14;
import '../screens/goal_creation/goal_simulation.dart' as _i13;
import '../screens/home/home.dart' as _i3;
import '../screens/informacion/informacion.dart' as _i7;
import '../screens/inversiones/inversiones.dart' as _i20;
import '../screens/login/login.dart' as _i2;
import '../screens/menu/menu.dart' as _i6;
import '../screens/misionyvision/misionyvision.dart' as _i8;
import '../screens/perfil/perfil.dart' as _i5;
import '../screens/register/register.dart' as _i10;
import '../screens/reglamentos/reglamento.dart' as _i16;
import '../screens/tipos_fondo/info_fondo.dart' as _i15;

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
      var args = entry.routeData.argsAs<CuentaBancariaRouteArgs>(
          orElse: () => CuentaBancariaRouteArgs());
      return _i1.MaterialPageX(
          entry: entry,
          child: _i11.CuentaBancaria(
              key: args.key,
              isUpdateForm: args.isUpdateForm,
              bankAccountId: args.bankAccountId));
    },
    GoalCreationRoute.name: (entry) {
      var args = entry.routeData
          .argsAs<GoalCreationRouteArgs>(orElse: () => GoalCreationRouteArgs());
      return _i1.MaterialPageX(
          entry: entry,
          child: _i12.GoalCreation(
              key: args.key,
              isUpdateForm: args.isUpdateForm,
              goalId: args.goalId));
    },
    GoalSimulationRoute.name: (entry) {
      var args = entry.routeData.argsAs<GoalSimulationRouteArgs>(
          orElse: () => GoalSimulationRouteArgs());
      return _i1.MaterialPageX(
          entry: entry,
          child: _i13.GoalSimulation(key: args.key, goalId: args.goalId));
    },
    GoalListRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: const _i14.GoalList());
    },
    InfoFondoRoute.name: (entry) {
      var pathParams = entry.routeData.pathParams;
      var args = entry.routeData.argsAs<InfoFondoRouteArgs>(
          orElse: () => InfoFondoRouteArgs(tipo: pathParams.getString('tipo')));
      return _i1.MaterialPageX(
          entry: entry, child: _i15.InfoFondo(key: args.key, tipo: args.tipo));
    },
    ReglamentoRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: const _i16.Reglamento());
    },
    CreacionFondoRoute.name: (entry) {
      var args = entry.routeData.argsAs<CreacionFondoRouteArgs>(
          orElse: () => CreacionFondoRouteArgs());
      return _i1.MaterialPageX(
          entry: entry,
          child: _i17.CreacionFondo(tipo: args.tipo, key: args.key));
    },
    FormularioRoute.name: (entry) {
      var args = entry.routeData
          .argsAs<FormularioRouteArgs>(orElse: () => FormularioRouteArgs());
      return _i1.MaterialPageX(
          entry: entry,
          child: _i18.Formulario(
              tipoFondo: args.tipoFondo,
              tipoPersona: args.tipoPersona,
              key: args.key));
    },
    BankAccountListRoute.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry, child: const _i19.BankAccountList());
    },
    InversionesHomeRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i20.InversionesHome());
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
        _i1.RouteConfig(GoalSimulationRoute.name, path: '/goalsimulation'),
        _i1.RouteConfig(GoalListRoute.name, path: '/goallist'),
        _i1.RouteConfig(InfoFondoRoute.name, path: '/info-fondo/:tipo'),
        _i1.RouteConfig(ReglamentoRoute.name, path: '/reglamentos'),
        _i1.RouteConfig(CreacionFondoRoute.name, path: '/crear-fondo'),
        _i1.RouteConfig(FormularioRoute.name, path: '/formulario'),
        _i1.RouteConfig(BankAccountListRoute.name,
            path: '/cuenta_bancaria_list'),
        _i1.RouteConfig(InversionesHomeRoute.name, path: '/inversiones')
      ];
}

class LoginRoute extends _i1.PageRouteInfo {
  const LoginRoute() : super(name, path: '/');

  static const String name = 'LoginRoute';
}

class HomeRoute extends _i1.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i21.Key key, String titulo})
      : super(name,
            path: '/home', args: HomeRouteArgs(key: key, titulo: titulo));

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key, this.titulo});

  final _i21.Key key;

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

class CuentaBancariaRoute extends _i1.PageRouteInfo<CuentaBancariaRouteArgs> {
  CuentaBancariaRoute({_i21.Key key, bool isUpdateForm, int bankAccountId})
      : super(name,
            path: '/cuenta_bancaria',
            args: CuentaBancariaRouteArgs(
                key: key,
                isUpdateForm: isUpdateForm,
                bankAccountId: bankAccountId));

  static const String name = 'CuentaBancariaRoute';
}

class CuentaBancariaRouteArgs {
  const CuentaBancariaRouteArgs(
      {this.key, this.isUpdateForm, this.bankAccountId});

  final _i21.Key key;

  final bool isUpdateForm;

  final int bankAccountId;
}

class GoalCreationRoute extends _i1.PageRouteInfo<GoalCreationRouteArgs> {
  GoalCreationRoute({_i21.Key key, bool isUpdateForm, int goalId})
      : super(name,
            path: '/goalcreation',
            args: GoalCreationRouteArgs(
                key: key, isUpdateForm: isUpdateForm, goalId: goalId));

  static const String name = 'GoalCreationRoute';
}

class GoalCreationRouteArgs {
  const GoalCreationRouteArgs({this.key, this.isUpdateForm, this.goalId});

  final _i21.Key key;

  final bool isUpdateForm;

  final int goalId;
}

class GoalSimulationRoute extends _i1.PageRouteInfo<GoalSimulationRouteArgs> {
  GoalSimulationRoute({_i21.Key key, int goalId})
      : super(name,
            path: '/goalsimulation',
            args: GoalSimulationRouteArgs(key: key, goalId: goalId));

  static const String name = 'GoalSimulationRoute';
}

class GoalSimulationRouteArgs {
  const GoalSimulationRouteArgs({this.key, this.goalId});

  final _i21.Key key;

  final int goalId;
}

class GoalListRoute extends _i1.PageRouteInfo {
  const GoalListRoute() : super(name, path: '/goallist');

  static const String name = 'GoalListRoute';
}

class InfoFondoRoute extends _i1.PageRouteInfo<InfoFondoRouteArgs> {
  InfoFondoRoute({_i21.Key key, String tipo})
      : super(name,
            path: '/info-fondo/:tipo',
            args: InfoFondoRouteArgs(key: key, tipo: tipo),
            params: {'tipo': tipo});

  static const String name = 'InfoFondoRoute';
}

class InfoFondoRouteArgs {
  const InfoFondoRouteArgs({this.key, this.tipo});

  final _i21.Key key;

  final String tipo;
}

class ReglamentoRoute extends _i1.PageRouteInfo {
  const ReglamentoRoute() : super(name, path: '/reglamentos');

  static const String name = 'ReglamentoRoute';
}

class CreacionFondoRoute extends _i1.PageRouteInfo<CreacionFondoRouteArgs> {
  CreacionFondoRoute({String tipo, _i21.Key key})
      : super(name,
            path: '/crear-fondo',
            args: CreacionFondoRouteArgs(tipo: tipo, key: key));

  static const String name = 'CreacionFondoRoute';
}

class CreacionFondoRouteArgs {
  const CreacionFondoRouteArgs({this.tipo, this.key});

  final String tipo;

  final _i21.Key key;
}

class FormularioRoute extends _i1.PageRouteInfo<FormularioRouteArgs> {
  FormularioRoute({String tipoFondo, int tipoPersona, _i21.Key key})
      : super(name,
            path: '/formulario',
            args: FormularioRouteArgs(
                tipoFondo: tipoFondo, tipoPersona: tipoPersona, key: key));

  static const String name = 'FormularioRoute';
}

class FormularioRouteArgs {
  const FormularioRouteArgs({this.tipoFondo, this.tipoPersona, this.key});

  final String tipoFondo;

  final int tipoPersona;

  final _i21.Key key;
}

class BankAccountListRoute extends _i1.PageRouteInfo {
  const BankAccountListRoute() : super(name, path: '/cuenta_bancaria_list');

  static const String name = 'BankAccountListRoute';
}

class InversionesHomeRoute extends _i1.PageRouteInfo {
  const InversionesHomeRoute() : super(name, path: '/inversiones');

  static const String name = 'InversionesHomeRoute';
}
