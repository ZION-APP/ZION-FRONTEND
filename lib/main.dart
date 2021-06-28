import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zionapp/constants_config.dart';
import 'package:flutter/material.dart';
import 'package:zionapp/bloc/auth/auth_state.dart';
import 'package:zionapp/bloc/buzon/buzon_bloc.dart';
import 'package:zionapp/bloc/buzon/buzon_state.dart';
import 'package:zionapp/routes/router.gr.dart';

import 'bloc/auth/auth_bloc.dart';

final _appRouter = AppRouter();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LogInBloc>(
          create: (_) => LogInBloc(LoginInitial()),
        ),
        BlocProvider<BuzonBloc>(
          create: (_) => BuzonBloc(BuzonLoading()),
        )
      ],
      child: MaterialApp.router(
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kPrimaryLightColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}
