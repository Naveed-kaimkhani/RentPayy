import 'dart:convert';
import 'package:rentpayy/model/hostelModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Strings.dart';
class StorageServiceHostel{
  static late SharedPreferences _sharedPreferences;

  static Future<void> saveHostel(hostelModel hostelModel) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences.setString(
        HOSTEL_PREFS_KEY, json.encode(hostelModel.toMap(hostelModel)));
  
  }

  static Future<hostelModel?> readHostel() async {
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
