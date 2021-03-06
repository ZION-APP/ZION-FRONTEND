import 'package:zionApp/Constants.dart';
import 'package:auto_route/auto_route.dart';
import 'package:zionApp/screens/alicuotas/alicuota.dart';
import 'package:zionApp/screens/home/home.dart';
import 'package:zionApp/screens/login/login.dart';
import 'package:zionApp/screens/menu/menu.dart';
import 'package:zionApp/screens/perfil/perfil.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(page: Login, path: "/", initial: true),
  MaterialRoute(
    page: Home,
    path: '/home',
  ),
  MaterialRoute(
    page: AlicuotaHome,
    path: '/alicuotas',
  ),
  MaterialRoute(page: PerfilHome, path: "/perfil"),
  MaterialRoute(page: MenuHome, path: "/menu")
])
class $AppRouter {}
