import 'package:dio/dio.dart';
import 'package:zionapp/constants_config.dart';

class DioClient {
  Dio dio = Dio(BaseOptions(connectTimeout: 5000, sendTimeout: 5000));

  static final DioClient _dioClient = DioClient._internal();

  factory DioClient() {
    _dioClient.dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      final String token = await storage.read(key: "token");
      options.headers["Authorization"] = "Bearer $token";
      return handler.next(options);
    }));
    return _dioClient;
  }

  DioClient._internal();
}
