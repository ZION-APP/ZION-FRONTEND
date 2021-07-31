import 'package:auto_route/auto_route.dart';
import 'package:zionapp/screens/alicuotas/alicuota.dart';
import 'package:zionapp/screens/contactanos/contactanos.dart';
import 'package:zionapp/screens/cuenta_bancaria/cuenta_bancaria.dart';
import 'package:zionapp/screens/goal_creation/goal_creation.dart';
import 'package:zionapp/screens/goal_creation/goal_simulation.dart';
import 'package:zionapp/screens/home/home.dart';
import 'package:zionapp/screens/informacion/informacion.dart';
import 'package:zionapp/screens/login/login.dart';
import 'package:zionapp/screens/menu/menu.dart';
import 'package:zionapp/screens/misionyvision/misionyvision.dart';
import 'package:zionapp/screens/perfil/perfil.dart';
import 'package:zionapp/screens/register/register.dart';

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
  MaterialRoute(page: GoalSimulation, path: "/goalsimulation"),
])
class $AppRouter {}
