import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../utils/style/AppColors.dart';
class HostelDropdown_button extends StatefulWidget {
  HostelDropdown_button({required this.list, required this.hinttext, Key? key})
      : super(key: key);

  List<String> list = [];

  String? hinttext;
  FirebaseFirestore db = FirebaseFirestore.instance;

  final user = FirebaseAuth.instance.currentUser!.uid;
  @override
  State<HostelDropdown_button> createState() => _HostelDropdown_buttonState();
}

class _HostelDropdown_buttonState extends State<HostelDropdown_button> {
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
            child: Icon(
              Icons.arrow_drop_down,
              color: AppColors.primaryColor,
            ),
          ),
          dropdownDecoration: BoxDecoration(
            color: AppColors.textfieldsColor,
            borderRadius: BorderRadius.circular(7.r),
          ),
          hint: Text(widget.hinttext!),
          items: widget.list
              .map(
                (value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                ),
              )
              .toList(),
          onChanged: (value) {
            // print(value);
            setState(() {
              widget.hinttext = value as String;
            });
                widget.db.collection("hostels").doc(widget.user).update({
      "hostel_type": widget.hinttext,
    });
          },
        ),
      ),
    );
  }

}
