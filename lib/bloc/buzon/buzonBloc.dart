import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zionApp/Constants.dart';
import 'package:zionApp/bloc/auth/authBloc.dart';
import 'package:zionApp/bloc/buzon/buzonEvent.dart';
import 'package:zionApp/bloc/buzon/buzonState.dart';
import 'package:dio/dio.dart';

class BuzonBloc extends Bloc<BuzonEvent, BuzonState> {
  BuzonBloc(BuzonLoading inicial) : super(inicial);

  // Under the hood, the Bloc library works with regular Dart Streams.
  // The "async*" makes this method an async generator, which outputs a Stream
  @override
  Stream<BuzonState> mapEventToState(BuzonEvent event) async* {
    if (event is GetBuzon) {
      // Outputting a state from the asynchronous generator
      BuildContext context = event.context;
      yield BuzonLoading();
      try {
        String token = await storage.read(key: "token");
        Response response = await Dio().get("$kapiUrl/noticias",
            options: Options(headers: {"token": token}));
        yield BuzonCompleted(response.data["respuesta"]);
      } on DioError catch (e) {
        if (e.response == null) {
          yield BuzonFailed("Error de conexion con el servidor");
        }
        LogInBloc.verificarToken(e.response.statusCode, context);
        yield BuzonFailed("Error de api");
      }
      await Future.delayed(Duration(seconds: 1));
    }
  }
}
