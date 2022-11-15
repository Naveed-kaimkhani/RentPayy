import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/utils/utils.dart';

import '../utils/style/AppColors.dart';

class passfield extends StatelessWidget {
String? hint_text;
  FocusNode? currentNode;
  FocusNode? nextNode;
  FocusNode? focusNode;
  Function()? onIconPress;
  bool? visiblity;
  // TextInputType keyboardType;
  Widget? icon;
  TextEditingController? controller;
  passfield({
    required this.hint_text,
    required this.currentNode,
    required this.focusNode,
    required this.nextNode,
    required this.controller,
    this.icon,
    this.onIconPress,
    this.visiblity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 371.w,
      //  color: Colors.white,
      decoration: BoxDecoration(
          color: AppColors.textfieldsColor,
          borderRadius: BorderRadius.circular(12.r)),
      // ignore: prefer_const_constructors
      child: TextField(
        // keyboardType: keyboardType,
        onEditingComplete: () =>
            utils.fieldFocusChange(context, currentNode!, nextNode!),
        controller: controller,
        cursorColor: Colors.black,
        focusNode: focusNode,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: AppColors.primaryColor, width: 1.0),
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 16.w , top: 20.h),
            hintText: hint_text,
            hintStyle: TextStyle(
              color: Colors.black,
              fontSize: 17.sp,
            ),
            suffixIcon: icon,
            ),
      ),
    );;
  }
}