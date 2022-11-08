import 'dart:convert';
import 'package:rentpayy/model/hostelModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Strings.dart';
class storage_service_hostel{
  static late SharedPreferences _sharedPreferences;

  static Future<void> saveUser(hostelModel hostelModel) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences.setString(
        HOSTEL_PREFS_KEY, json.encode(hostelModel.toMap(hostelModel)));
      print("user created in preferences");
  
  }

  static Future<hostelModel?> readUser() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return _sharedPreferences.getString(HOSTEL_PREFS_KEY) == null
        ? null
        : hostelModel.fromJson(
        json.decode(_sharedPreferences.getString(HOSTEL_PREFS_KEY)!));
  }

  static Future<void> clear() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences.clear();
  }
}
