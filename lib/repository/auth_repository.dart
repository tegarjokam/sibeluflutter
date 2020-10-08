import 'package:sibeluapp/models/login_body_model.dart';
import 'package:sibeluapp/models/token_model.dart';

import './auth_provider.dart';

class AuthRepository {
  final AuthProvider _authProvider = AuthProvider();

  Future<Token> getToken(LoginBody loginBody) =>
      _authProvider.getToken(loginBody);
}
