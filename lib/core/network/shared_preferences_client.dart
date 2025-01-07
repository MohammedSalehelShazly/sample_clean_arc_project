import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesClient {
  final SharedPreferences sharedPreferences;
  const SharedPreferencesClient(this.sharedPreferences);

  Future<bool> cacheString(String key, String value) =>
      sharedPreferences.setString(key, value);

  String? fetchString(String key) => sharedPreferences.getString(key);
}
