import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sibeluapp/models/login_body_model.dart';
import '../models/token_model.dart';

class AuthProvider {
  final client = http.Client();
  final baseUrl = "http://192.168.1.9:8081";
  final clientId = 'sibeluApp';
  final clientPwd = 'sibeluSecret';
  Map<String, String> headers = {
    "Content-Type": "application/x-www-form-urlencoded",
    'Accept': 'application/json',
    'Authorization': 'Basic ${base64Encode(
      utf8.encode('sibeluApp:sibeluSecret'),
    )}',
  };

  Future<Token> getToken(LoginBody loginBody) async {
    try {
      print('masuk');
      var response = await client.post(
        '$baseUrl/oauth/token',
        headers: headers,
        body: loginBody.toJson(),
      );
      var responseJson = json.decode(response.body);
      print(responseJson.toString());
      return Token.from(responseJson);
    } catch (e) {
      print('error');
    }
  }
}
