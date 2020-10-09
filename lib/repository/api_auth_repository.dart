import 'package:sibeluapp/models/diagnostic/diagnostic.dart';
import 'package:sibeluapp/models/login/login_body.dart';
import 'package:sibeluapp/models/refreshtoken/refresh_token_body.dart';
import 'package:sibeluapp/models/register/register.dart';
import 'package:sibeluapp/models/token/token.dart';
import 'package:sibeluapp/models/user_model.dart';

import 'api_auth_provider.dart';

class ApiAuthRepository {
  final ApiAuthProvider _apiAuthProvider = ApiAuthProvider();

  Future<Diagnostic> postRegisterUser(Register register) =>
      _apiAuthProvider.registerUser(register);

  Future<Token> postLoginUser(LoginBody loginBody) =>
      _apiAuthProvider.loginUser(loginBody);

  Future<Token> postRefreshAuth(RefreshTokenBody refreshTokenBody) =>
      _apiAuthProvider.refreshAuth(refreshTokenBody);

  Future<User> fetchAllUsers() => _apiAuthProvider.getAllUsers();

  Future<User> getProfile() => _apiAuthProvider.getProfile();
}
