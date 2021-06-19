// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i11;

import '../screens/alicuotas/alicuota.dart' as _i4;
import '../screens/contactanos/contactanos.dart' as _i9;
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
      var args = entry.routeData
          .argsAs<LoginRouteArgs>(orElse: () => LoginRouteArgs());
      return _i1.MaterialPageX(entry: entry, child: _i2.Login(key: args.key));
    },
    HomeRoute.name: (entry) {
      var args =
          entry.routeData.argsAs<HomeRouteArgs>(orElse: () => HomeRouteArgs());
      return _i1.MaterialPageX(
          entry: entry, child: _i3.Home(key: args.key, titulo: args.titulo));
    },
    AlicuotaHomeRoute.name: (entry) {
      var args = entry.routeData
          .argsAs<AlicuotaHomeRouteArgs>(orElse: () => AlicuotaHomeRouteArgs());
      return _i1.MaterialPageX(
          entry: entry, child: _i4.AlicuotaHome(key: args.key));
    },
    PerfilHomeRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i5.PerfilHome());
    },
    MenuHomeRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i6.MenuHome());
    },
    InformacionRoute.name: (entry) {
      var args = entry.routeData
          .argsAs<InformacionRouteArgs>(orElse: () => InformacionRouteArgs());
      return _i1.MaterialPageX(
          entry: entry, child: _i7.Informacion(key: args.key));
    },
    VisionyMisionRoute.name: (entry) {
      var args = entry.routeData.argsAs<VisionyMisionRouteArgs>(
          orElse: () => VisionyMisionRouteArgs());
      return _i1.MaterialPageX(
          entry: entry, child: _i8.VisionyMision(key: args.key));
    },
    ContactanosRoute.name: (entry) {
      var args = entry.routeData
          .argsAs<ContactanosRouteArgs>(orElse: () => ContactanosRouteArgs());
      return _i1.MaterialPageX(
          entry: entry, child: _i9.Contactanos(key: args.key));
    },
    RegisterRoute.name: (entry) {
      var args = entry.routeData
          .argsAs<RegisterRouteArgs>(orElse: () => RegisterRouteArgs());
      return _i1.MaterialPageX(
          entry: entry, child: _i10.Register(key: args.key));
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
        _i1.RouteConfig(RegisterRoute.name, path: '/register')
      ];
}

class LoginRoute extends _i1.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({_i11.Key key})
      : super(name, path: '/', args: LoginRouteArgs(key: key));

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i11.Key key;
}

class HomeRoute extends _i1.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i11.Key key, String titulo})
      : super(name,
            path: '/home', args: HomeRouteArgs(key: key, titulo: titulo));

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key, this.titulo});

  final _i11.Key key;

  final String titulo;
}

class AlicuotaHomeRoute extends _i1.PageRouteInfo<AlicuotaHomeRouteArgs> {
  AlicuotaHomeRoute({_i11.Key key})
      : super(name, path: '/alicuotas', args: AlicuotaHomeRouteArgs(key: key));

  static const String name = 'AlicuotaHomeRoute';
}

class AlicuotaHomeRouteArgs {
  const AlicuotaHomeRouteArgs({this.key});

  final _i11.Key key;
}

class PerfilHomeRoute extends _i1.PageRouteInfo {
  const PerfilHomeRoute() : super(name, path: '/perfil');

  static const String name = 'PerfilHomeRoute';
}

class MenuHomeRoute extends _i1.PageRouteInfo {
  const MenuHomeRoute() : super(name, path: '/menu');

  static const String name = 'MenuHomeRoute';
}

class InformacionRoute extends _i1.PageRouteInfo<InformacionRouteArgs> {
  InformacionRoute({_i11.Key key})
      : super(name, path: '/informacion', args: InformacionRouteArgs(key: key));

  static const String name = 'InformacionRoute';
}

class InformacionRouteArgs {
  const InformacionRouteArgs({this.key});

  final _i11.Key key;
}

class VisionyMisionRoute extends _i1.PageRouteInfo<VisionyMisionRouteArgs> {
  VisionyMisionRoute({_i11.Key key})
      : super(name,
            path: '/misionyvision', args: VisionyMisionRouteArgs(key: key));

  static const String name = 'VisionyMisionRoute';
}

class VisionyMisionRouteArgs {
  const VisionyMisionRouteArgs({this.key});

  final _i11.Key key;
}

class ContactanosRoute extends _i1.PageRouteInfo<ContactanosRouteArgs> {
  ContactanosRoute({_i11.Key key})
      : super(name, path: '/contactanos', args: ContactanosRouteArgs(key: key));

  static const String name = 'ContactanosRoute';
}

class ContactanosRouteArgs {
  const ContactanosRouteArgs({this.key});

  final _i11.Key key;
}

class RegisterRoute extends _i1.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({_i11.Key key})
      : super(name, path: '/register', args: RegisterRouteArgs(key: key));

  static const String name = 'RegisterRoute';
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key});

  final _i11.Key key;
}
