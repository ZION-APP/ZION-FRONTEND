import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zionApp/Constants.dart';
import 'package:flutter/material.dart';
import 'package:zionApp/bloc/auth/authState.dart';
import 'package:zionApp/bloc/buzon/buzonBloc.dart';
import 'package:zionApp/bloc/buzon/buzonState.dart';
import 'package:zionApp/routes/router.gr.dart';

import 'bloc/auth/authBloc.dart';

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
