import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  // Private constructor for singleton pattern
  SharedPreferencesService._privateConstructor();

  // Single instance for global access
  static final SharedPreferencesService instance = SharedPreferencesService._privateConstructor();

  SharedPreferences? _prefs;

  // Initialize SharedPreferences instance
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Save String data
  Future<void> saveString(String key, String value) async {
    if (_prefs == null) {
      throw Exception("SharedPreferences not initialized. Call init() first.");
    }
    await _prefs!.setString(key, value);
  }

  // Get String data
  String? getString(String key) {
    if (_prefs == null) {
      throw Exception("SharedPreferences not initialized. Call init() first.");
    }
    return _prefs!.getString(key);
  }

  // Save Integer data
  Future<void> saveInt(String key, int value) async {
    if (_prefs == null) {
      throw Exception("SharedPreferences not initialized. Call init() first.");
    }
    await _prefs!.setInt(key, value);
  }

  // Get Integer data
  int? getInt(String key) {
    if (_prefs == null) {
      throw Exception("SharedPreferences not initialized. Call init() first.");
    }
    return _prefs!.getInt(key);
  }

  // Save Boolean data
  Future<void> saveBool(String key, bool value) async {
    if (_prefs == null) {
      throw Exception("SharedPreferences not initialized. Call init() first.");
    }
    await _prefs!.setBool(key, value);
  }

  // Get Boolean data
  bool? getBool(String key) {
    if (_prefs == null) {
      throw Exception("SharedPreferences not initialized. Call init() first.");
    }
    return _prefs!.getBool(key);
  }

  // Save List<String> data
  Future<void> saveStringList(String key, List<String> value) async {
    if (_prefs == null) {
      throw Exception("SharedPreferences not initialized. Call init() first.");
    }
    await _prefs!.setStringList(key, value);
  }

  // Get List<String> data
  List<String>? getStringList(String key) {
    if (_prefs == null) {
      throw Exception("SharedPreferences not initialized. Call init() first.");
    }
    return _prefs!.getStringList(key);
  }

  // Remove data
  Future<void> remove(String key) async {
    if (_prefs == null) {
      throw Exception("SharedPreferences not initialized. Call init() first.");
    }
    await _prefs!.remove(key);
  }

  // Clear all data
  Future<void> clear() async {
    if (_prefs == null) {
      throw Exception("SharedPreferences not initialized. Call init() first.");
    }
    await _prefs!.clear();
  }

  // Check if key exists
  bool containsKey(String key) {
    if (_prefs == null) {
      throw Exception("SharedPreferences not initialized. Call init() first.");
    }
    return _prefs!.containsKey(key);
  }

  // Update data (generic)
  Future<void> update<T>(String key, T value) async {
    if (_prefs == null) {
      throw Exception("SharedPreferences not initialized. Call init() first.");
    }
    if (value is String) {
      await saveString(key, value);
    } else if (value is int) {
      await saveInt(key, value);
    } else if (value is bool) {
      await saveBool(key, value);
    } else if (value is List<String>) {
      await saveStringList(key, value);
    } else {
      throw Exception("Unsupported type");
    }
  }
}

// Usage Example:
// void main() async {
//   final prefs = SharedPreferencesService.instance;
//   await prefs.init();

//   await prefs.saveString("username", "Mahesh");
//   String? username = prefs.getString("username");
//   print(username); // Output: Mahesh

//   await prefs.remove("username");
//   print(prefs.getString("username")); // Output: null
// }
