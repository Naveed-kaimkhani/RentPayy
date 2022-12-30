import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/utils/style/AppColors.dart';

class CustomTextStyle {
  static final font_13 = TextStyle(
    color: AppColors.blackColor,
    fontSize: 13.sp,
    fontWeight: FontWeight.w300,
  );
   static final font_54 = TextStyle(
    color: Colors.black,
    fontSize: 54.sp,
    fontWeight: FontWeight.w700,
  );
  static final font_33 = TextStyle(
    color: Colors.black,
    fontSize: 33.sp,
    fontWeight: FontWeight.w400,
  );
   static final headingsAll_26 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 26.sp,
    color: Colors.black,
  );
  static final font_16 = TextStyle(
    color: AppColors.blackColor,
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
  );
  static final font_17 = TextStyle(
    color: Colors.white,
    fontSize: 17.sp,
    fontWeight: FontWeight.normal,
  );
  static final font_black = TextStyle(
    color: Colors.black,
    fontSize: 17.sp,
    fontWeight: FontWeight.normal,
  );
  static final font_black_w500 = TextStyle(
    color: Colors.black,
    fontSize: 17.sp,
    fontWeight: FontWeight.w500,
  );
  static final startScreensUnderHeadingTextStyle = TextStyle(
      decoration: TextDecoration.none,
      color: AppColors.textfieldsColor,
      fontSize: 20.sp);
  static final startScreenEndLineTextStyle =
      TextStyle(color: AppColors.blackColor, fontSize: 1.8.sp);
  static final startScreenEndLineTextStyle2 = TextStyle(fontSize: 18.sp);

  static final headingsAll = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 23.sp,
    color: Colors.black,
  );

  static final semiheading =
      TextStyle(fontWeight: FontWeight.w700, color: AppColors.blackColor);

  static final textProfileCards = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 2.15.sp,
      color: AppColors.blackColor);

  static final textSettingCards = TextStyle(
      fontWeight: FontWeight.w600, fontSize: 2.sp, color: AppColors.blackColor);
}
