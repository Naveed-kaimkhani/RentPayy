import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/utils/style/AppColors.dart';
import 'package:rentpayy/utils/utils.dart';

class inputfields extends StatelessWidget {
  String? hint_text;
  FocusNode? currentNode;
  FocusNode? nextNode;
  bool? obsecureText;
  FocusNode? focusNode;
  IconData? icon;
  Widget? preicon;
  // bool? visiblity;
  Function()? onIconPress;
  TextEditingController? controller;
  inputfields({
    required this.hint_text,
    required this.currentNode,
    required this.focusNode,
    required this.nextNode,
    required this.controller,
    this.icon,
    this.preicon,
    this.onIconPress,
    this.obsecureText,

    // this.visiblity,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 60.h,
      width: 371.w,
      //  color: Colors.white,
      decoration: BoxDecoration(
          color: AppColors.textfieldsColor,
          borderRadius: BorderRadius.circular(7.r)),
      // ignore: prefer_const_constructors
      child: TextField(
        // keyboardType: keyboardType,
        obscureText: obsecureText ?? false,
        onEditingComplete: () =>
            utils.fieldFocusChange(context, currentNode!, nextNode!),
        controller: controller,
        cursorColor: Colors.black,
        focusNode: focusNode,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.r),
            borderSide: BorderSide(color: AppColors.primaryColor, width: 1.0),
          ),
          border: InputBorder.none,
          hintText: hint_text,
          hintStyle: TextStyle(
            color: Color.fromARGB(255, 120, 111, 111),
            fontSize: 17.sp,
          ),
          prefixIcon: preicon,
          suffixIcon: InkWell(
            child: Icon(
              icon,
              color: Color.fromARGB(255, 65, 61, 61),
            ),
            onTap: onIconPress,
          ),
        ),
      ),
    );
  }
}
