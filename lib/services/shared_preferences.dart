import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  SharedPreferencesService();

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key) ?? "");
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  getKeys() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getKeys();
  }

  clearPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
