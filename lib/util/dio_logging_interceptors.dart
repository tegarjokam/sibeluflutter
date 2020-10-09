import 'package:dio/dio.dart';
import 'package:sibeluapp/injector/injector.dart';
import 'package:sibeluapp/storage/sharedpreferences/shared_preferences_manager.dart';

class DioLoggingInterceptors extends InterceptorsWrapper {
  // ignore: unused_field
  final Dio _dio;
  final SharedPreferencesManager _sharedPreferencesManager =
      locator<SharedPreferencesManager>();

  DioLoggingInterceptors(this._dio);

  @override
  Future onRequest(RequestOptions options) async {
    print(
        "--> ${options.method != null ? options.method.toUpperCase() : 'METHOD'} ${"" + (options.baseUrl ?? "") + (options.path ?? "")}");
    print("Headers:");
    options.headers.forEach((k, v) => print('$k: $v'));
    if (options.queryParameters != null) {
      print("queryParameters:");
      options.queryParameters.forEach((k, v) => print('$k: $v'));
    }
    if (options.data != null) {
      print("Body: ${options.data}");
    }
    print(
        "--> END ${options.method != null ? options.method.toUpperCase() : 'METHOD'}");

    if (options.headers.containsKey('requirestoken')) {
      options.headers.remove('requirestoken');
      print(
          'accessToken: ${_sharedPreferencesManager.getString(SharedPreferencesManager.keyAccessToken)}');
      String accessToken = _sharedPreferencesManager
          .getString(SharedPreferencesManager.keyAccessToken);
      options.headers.addAll({'Authorization': 'Bearer $accessToken'});
    }
    return options;
  }
}
