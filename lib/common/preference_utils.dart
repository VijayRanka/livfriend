import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils {
  static SharedPreferences? _preferences;

  static Future<SharedPreferences> get _instance async =>
      _preferences ??= await SharedPreferences.getInstance();

  static Future<SharedPreferences?> init() async {
    _preferences = await _instance;
    return _preferences;
  }

  static String? getString(String key, {String defValue = ""}) {
    return _preferences!.getString(key) ?? defValue;
  }

  static Future<bool> setString(String key, String value) async {
    await _preferences!.setString(key, value);
    return Future.value(true);
  }

  static bool? getBool(String key, {bool defValue = false}) {
    return _preferences!.getBool(key) ?? defValue;
  }

  static Future<bool> setBool(String key, bool value) async {
    await _preferences!.setBool(key, value);
    return Future.value(true);
  }

  static Future<bool> removeBool(String key) async {
    return await _preferences!.remove(key);
  }

  static bool containsBoolKey(String key) {
    return _preferences!.containsKey(key);
  }
}
