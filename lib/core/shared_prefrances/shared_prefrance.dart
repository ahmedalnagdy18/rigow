import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrance {
  SharedPrefrance._();
  late SharedPreferences sharedPreferences;
  static final instanc = SharedPrefrance._();
// Saving String to Shared Preferences
  Future<SharedPreferences> initialization({required sharedPreferences}) async {
    this.sharedPreferences = sharedPreferences;
    return sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> setToken({required String key, required String token}) {
//    print("set Token: ${token}");
    return sharedPreferences.setString(key, token);
  }

  String? getToken(String key) {
    return sharedPreferences.getString(key);
  }

  Future<bool> removeFromShared({required String key}) {
    return sharedPreferences.remove(key);
  }

  // Future<void> saveUserRole(String role) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('user_role', role);
  // }

  // Future<String?> getUserRole() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getString('user_role');
  // }
}
