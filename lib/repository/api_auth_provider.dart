import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:sibeluapp/models/diagnostic/diagnostic.dart';
import 'package:sibeluapp/models/login/login_body.dart';
import 'package:sibeluapp/models/refreshtoken/refresh_token_body.dart';
import 'package:sibeluapp/models/register/register.dart';
import 'package:sibeluapp/models/token/token.dart';
import 'package:sibeluapp/util/dio_logging_interceptors.dart';
import '../constants.dart';
import '../models/user_model.dart';

class ApiAuthProvider {
  final Dio _dio = new Dio();

  ApiAuthProvider() {
    _dio.options.baseUrl = baseUrl;
    _dio.interceptors.add(DioLoggingInterceptors(_dio));
  }

  Future<Diagnostic> registerUser(Register register) async {
    try {
      final response = await _dio.post(
        'register/user',
        data: register.toJson(),
        options: Options(
          headers: {
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

  Future<Token> loginUser(LoginBody loginBody) async {
    try {
      final response = await _dio.post(
        'oauth/token',
        data: FormData.fromMap(loginBody.toJson()),
        options: Options(
          headers: {
            'Authorization': 'Basic ${base64Encode(
              utf8.encode('$clientId:$clientSecret'),
            )}',
          },
        ),
      );
      return Token.fromJson(response.data);
    } catch (error, stacktrace) {
      print('ERRROORRR ====>>>>>>');
      // _printError(error, stacktrace);
      return Token.withError('$error');
    }
  }

  Future<Token> refreshAuth(RefreshTokenBody refreshTokenBody) async {
    try {
      final response = await _dio.post(
        'oauth/token',
        data: FormData.fromMap(refreshTokenBody.toJson()),
        options: Options(
          headers: {
            'Authorization': 'Basic ${base64Encode(
              utf8.encode('$clientId:$clientSecret'),
            )}',
          },
        ),
      );
      return Token.fromJson(response.data);
    } catch (error, stacktrace) {
      _printError(error, stacktrace);
      return Token.withError('$error');
    }
  }

  Future<User> getAllUsers() async {
    try {
      print('getAllUsers');
      final response = await _dio.get(
        'users/user',
        options: Options(
          headers: {
            'requirestoken': true,
          },
        ),
      );
      return User.fromJson(response.data);
    } catch (error, stacktrace) {
      _printError(error, stacktrace);
      return User.withError('$error');
    }
  }

  Future<User> getProfile() async {
    try {
      print('getAllUsers');
      final response = await _dio.get(
        'api/rest/account/v1/employee/profile',
        options: Options(
          headers: {
            'requirestoken': true,
          },
        ),
      );
      return User.fromJson(response.data);
    } catch (error, stacktrace) {
      _printError(error, stacktrace);
      return User.withError('$error');
    }
  }

  void _printError(error, StackTrace stacktrace) {
    debugPrint('error: $error & stacktrace: $stacktrace');
  }
}
