import 'dart:core';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/style/AppColors.dart';
import '../utils/style/Images.dart';

class Dropdown_button extends StatefulWidget {
  Dropdown_button({required this.list, required this.hinttext, Key? key})
      : super(key: key);

  List<String> list = [];

  String? hinttext;

  @override
  State<Dropdown_button> createState() => _Dropdown_buttonState();
}

class _Dropdown_buttonState extends State<Dropdown_button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      // width: 185.w,
      decoration: BoxDecoration(
        color: Color(0xffF4F7FF),
        borderRadius: BorderRadius.circular(7.r),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          focusColor: AppColors.primaryColor,
          dropdownElevation: 0,
          buttonElevation: 0,
          icon: Padding(
            padding: EdgeInsets.only(right: 17.w),
            child: Icon(Icons.arrow_drop_down,color: AppColors.primaryColor,),
          ),
          dropdownDecoration: BoxDecoration(
            color: AppColors.textfieldsColor,
            borderRadius: BorderRadius.circular(7.r),
          ),
          hint: Text(widget.hinttext!),
          items: widget.list!
              .map(
                (value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                ),
              )
              .toList(),
          onChanged: (value) {
            print(value);
            setState(() {
              widget.hinttext = value as String;
            });
          },
        ),
      ),
    );
  }
}
