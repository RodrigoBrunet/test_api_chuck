import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsDb {
  static const String _key = 'chave';

  static saveValue(String email, String password) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(_key, jsonEncode({"email": email, "password": password}));
  }

  static getValue(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(_key);
  }

  static clearValue() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.remove(_key);
  }
}
