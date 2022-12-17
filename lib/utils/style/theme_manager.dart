import 'package:flutter/material.dart';
import 'package:rentpayy/utils/style/text_style.dart';

class Thememanager {
  ThemeData getApplicationTheme() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        titleTextStyle: CustomTextStyle.headingsAll,
      ),
    );
  }
}
