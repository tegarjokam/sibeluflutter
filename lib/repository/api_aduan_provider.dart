import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sibeluapp/models/aduan/aduan_body.dart';
import 'package:sibeluapp/models/diagnostic/diagnostic.dart';
import 'package:sibeluapp/util/dio_logging_interceptors.dart';
import '../constants.dart';

class ApiAduanProvider {
  final Dio _dio = new Dio();

  ApiAduanProvider() {
    _dio.options.baseUrl = baseUrl;
    _dio.interceptors.add(DioLoggingInterceptors(_dio));
  }

  Future<Diagnostic> postAduan(AduanBody aduan) async {
    try {
      final response = await _dio.post(
        'api/rest/aduan/v1/createByCurrentPrincipal',
        data: aduan.toJson(),
        options: Options(
          headers: {
            'requirestoken': true,
            'Content-Type': 'application/json',
          },
        ),
      );
      return Diagnostic.fromJson(response.data);
    } catch (error, stacktrace) {
      _printError(error, stacktrace);
      return Diagnostic.withError('$error');
    }
  }

  // Future<Token> loginUser(LoginBody loginBody) async {
  //   try {
  //     final response = await _dio.post(
  //       'oauth/token',
  //       data: FormData.fromMap(loginBody.toJson()),
  //       options: Options(
  //         headers: {
  //           'Authorization': 'Basic ${base64Encode(
  //             utf8.encode('$clientId:$clientSecret'),
  //           )}',
  //         },
  //       ),
  //     );
  //     return Token.fromJson(response.data);
  //   } catch (error, stacktrace) {
  //     print('ERRROORRR ====>>>>>>');
  //     // _printError(error, stacktrace);
  //     return Token.withError('$error');
  //   }
  // }

  void _printError(error, StackTrace stacktrace) {
    debugPrint('error: $error & stacktrace: $stacktrace');
  }
}
