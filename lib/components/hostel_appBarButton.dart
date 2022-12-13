import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class hostel_appBarButton extends StatelessWidget {
  Color? Buttoncolor;
  String? IconUrl;
  hostel_appBarButton(
      {super.key, required this.Buttoncolor, required this.IconUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.h,
      width: 32.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        color: Buttoncolor,
      ),
      child: Center(
        child: Image.asset(IconUrl!),
      ),
    );
  }
}
