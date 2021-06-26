import 'package:auto_route/auto_route.dart';
import 'package:zionApp/screens/alicuotas/alicuota.dart';
import 'package:zionApp/screens/contactanos/contactanos.dart';
import 'package:zionApp/screens/cuenta_bancaria/cuenta_bancaria.dart';
import 'package:zionApp/screens/goal_creation/goal_creation.dart';
import 'package:zionApp/screens/home/home.dart';
import 'package:zionApp/screens/informacion/informacion.dart';
import 'package:zionApp/screens/login/login.dart';
import 'package:zionApp/screens/menu/menu.dart';
import 'package:zionApp/screens/misionyvision/misionyvision.dart';
import 'package:zionApp/screens/perfil/perfil.dart';
import 'package:zionApp/screens/register/register.dart';

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
  MaterialRoute(page: MenuHome, path: "/menu"),
  MaterialRoute(page: Informacion, path: "/informacion"),
  MaterialRoute(page: VisionyMision, path: "/misionyvision"),
  MaterialRoute(page: Contactanos, path: "/contactanos"),
  MaterialRoute(page: Register, path: "/register"),
  MaterialRoute(page: CuentaBancaria, path: "/cuenta_bancaria"),
  MaterialRoute(page: GoalCreation, path: "/goalcreation"),
])
class $AppRouter {}
