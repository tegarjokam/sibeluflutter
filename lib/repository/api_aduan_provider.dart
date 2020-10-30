import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sibeluapp/models/aduan/aduan_body.dart';
import 'package:sibeluapp/models/aduan/list_aduan.dart';
import 'package:sibeluapp/models/diagnostic/diagnostic.dart';
import 'package:sibeluapp/models/roles/roles.dart';
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

  Future<RolesBody> getRoles() async {
    try {
      final response = await _dio.get(
        'api/rest/account/v1/roles',
        options: Options(
          headers: {
            'requirestoken': true,
            'Content-Type': 'application/json',
          },
        ),
      );
      return RolesBody.fromJson(response.data);
    } catch (error, stacktrace) {
      _printError(error, stacktrace);
      return RolesBody.withError('$error');
    }
  }

  Future<ListAduan> getAllAduanListAdminByCreatedDate(
      String startDate, String endDate) async {
    try {
      final response = await _dio.get(
        'api/rest/aduan/v1/admin/findAll?',
        queryParameters: {
          'start': startDate,
          'end': endDate,
        },
        options: Options(
          headers: {
            'requirestoken': true,
            'Content-Type': 'application/json',
          },
        ),
      );
      return ListAduan.fromJson(response.data);
    } catch (error, stacktrace) {
      _printError(error, stacktrace);
      return ListAduan.withError('$error');
    }
  }

  void _printError(error, StackTrace stacktrace) {
    debugPrint('error: $error & stacktrace: $stacktrace');
  }
}
