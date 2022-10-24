import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/UserModel.dart';
import '../utils/Strings.dart';
class StorageService {
  static late SharedPreferences _sharedPreferences;

  static Future<void> saveUser(UserModel userModel) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences.setString(
        PREFS_KEY, json.encode(userModel.toMap(userModel)));
  }

  static Future<UserModel?> readUser() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return _sharedPreferences.getString(PREFS_KEY) == null
        ? null
        : UserModel.fromMap(
            json.decode(_sharedPreferences.getString(PREFS_KEY)!));
  }

  static Future<void> clear() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences.clear();
  }
}
