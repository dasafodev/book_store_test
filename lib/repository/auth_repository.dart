import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  AuthRepository(this._sharedPreferences);
  final SharedPreferences _sharedPreferences;

  bool login(String email, String password) {
    final pass = _sharedPreferences.getString(email);
    if (pass == null) {
      return false;
    }
    return pass == password;
  }

  Future<void> signup(String email, String password) async {
    await _sharedPreferences.setString(email, password);
  }
}
