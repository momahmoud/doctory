import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static SharedPreferencesService? _instance;
  static late SharedPreferences _preferences;

  SharedPreferencesService._();

  // Using a singleton pattern
  static Future<SharedPreferencesService> getInstance() async {
    _instance ??= SharedPreferencesService._();

    _preferences = await SharedPreferences.getInstance();

    return _instance!;
  }

  // Persist and retrieve username

  // Private generic method for retrieving data from shared preferences
  static dynamic getData(String key) {
    // Retrieve data from shared preferences
    var value = _preferences.get(key);
    if (kDebugMode) {
      print('Retrieved from shared preferences $key: $value');
    }
    return value;
  }

  // Private method for saving data to shared preferences
  static void saveData(String key, dynamic value) async {
    if (kDebugMode) {
      print('Saving $key: $value');
    }
    // Save data to shared preferences
    if (value is String) {
      await _preferences.setString(key, value);
    } else if (value is int) {
      await _preferences.setInt(key, value);
    } else if (value is double) {
      await _preferences.setDouble(key, value);
    } else if (value is bool) {
      await _preferences.setBool(key, value);
    } else if (value is List<String>) {
      await _preferences.setStringList(key, value);
    }
  }

  // Private method for removing data from shared preferences
  static void removeData(String key) async {
    if (kDebugMode) {
      print('Removing $key');
    }
    // Remove data from shared preferences
    await _preferences.remove(key);
  }

  // Private method for clearing all data from shared preferences
  static void clearData() async {
    if (kDebugMode) {
      print('Clearing all data');
    }
    // Clear all data from shared preferences
    await _preferences.clear();
  }

  // Private method for getting all keys from shared preferences
  static List<String> getAllKeys() {
    // Get all keys from shared preferences
    return _preferences.getKeys().toList();
  }

  //secure storage methods

  static void saveSecureData(String key, String value) async {
    const storage = FlutterSecureStorage();
    if (kDebugMode) {
      print('Saving secure $key: $value');
    }
    await storage.write(key: key, value: value);
  }

  static getSecureData(String key) async {
    const storage = FlutterSecureStorage();
    if (kDebugMode) {
      print('Retrieving secure $key');
    }
    return await storage.read(key: key) ?? '';
  }

  static removeSecureData(String key) async {
    const storage = FlutterSecureStorage();
    if (kDebugMode) {
      print('Removing secure $key');
    }
    await storage.delete(key: key);
  }
}
