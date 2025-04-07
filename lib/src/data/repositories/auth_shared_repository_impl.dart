import 'package:exchange_app/src/domain/repositories/auth_shared_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: AuthSharedRepository)
class AuthSharedRepositoryImpl implements AuthSharedRepository {
  static const String _loginKey = 'user_login';

  final SharedPreferences _sharedPreferences;

  AuthSharedRepositoryImpl(this._sharedPreferences);

  @override
  Future<void> saveLogin(String login) async {
    await _sharedPreferences.setString(_loginKey, login);
  }

  @override
  Future<String?> getLogin() async {
    return _sharedPreferences.getString(_loginKey);
  }

  @override
  Future<void> removeLogin() async {
    await _sharedPreferences.remove(_loginKey);
  }
}
