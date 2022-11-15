import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class authButton extends StatelessWidget {
  String? text;
  Function()? func;
  Color? color;
  authButton({
    required this.text,
    required this.func,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 321.w,
        height: 67.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Center(
          child: Text(
            text!,
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
        ),
      ),
      onTap: func,
    );
  }
}
