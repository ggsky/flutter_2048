import 'package:shared_preferences/shared_preferences.dart';

class SpUtil {
  static Future<SharedPreferences> sharedPreferences = SharedPreferences.getInstance();

  static Future<T> get<T>(String key) {
    key ??= '';
    return sharedPreferences.then((s) {
      return s.get(key) as T;
    });
  }

  static Future<bool> save<T>(String key, T value) async {
    key ??= '';
    return sharedPreferences.then((s) {
      if (value == null) {
        return s.remove(key);
      } else {
        if (value is int) {
          return s.setInt(key, value);
        }
        if (value is double) {
          return s.setDouble(key, value);
        }
        if (value is String) {
          return s.setString(key, value);
        }
        if (value is List<String>) {
          return s.setStringList(key, value);
        }
        if (value is bool) {
          return s.setBool(key, value);
        }
      }
      return false;
    });
  }

  static Future<bool> remove(String key) {
    key ??= '';
    return sharedPreferences.then((s) {
      return s.remove(key);
    });
  }

  static Future<bool> clear() {
    return sharedPreferences.then((s) {
      return s.clear();
    });
  }
}
