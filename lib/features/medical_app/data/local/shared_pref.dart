import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/// Local storage
class StorageUtil {
  StorageUtil._internal();
  static final StorageUtil _instance = StorageUtil._internal();

  factory StorageUtil() {
    return _instance;
  }

  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> setString(String key, String value) {
    return _prefs.setString(key, value);
  }

  String? getString(String key) {
    return _prefs.getString(key);
  }

  Future<bool> setJSON(String key, dynamic jsonVal) {
    var jsonString = jsonEncode(jsonVal);
    return _prefs.setString(key, jsonString);
  }

  dynamic getJSON(String key) {
    var jsonString = _prefs.getString(key);
    return jsonString == null ? null : jsonDecode(jsonString);
  }

  Future<bool> setBool(String key, bool val) {
    return _prefs.setBool(key, val);
  }

  bool? getBool(String key) {
    return _prefs.getBool(key);
  }

  Future<bool> remove(String key) {
    return _prefs.remove(key);
  }
}
