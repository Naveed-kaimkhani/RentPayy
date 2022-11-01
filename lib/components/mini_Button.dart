import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/style/AppColors.dart';


class MiniButton extends StatelessWidget {
  String? text;
  Function()? func;
  Color? color;
  String? icon;
  MiniButton({ required this.text,
    required this.func,
    required this.color,
    this.icon,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 157.w,
        height: 67.h,
        decoration: BoxDecoration(
          color: color!,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text!,
              style: TextStyle(
                  fontSize: 17.sp, color: Colors.white),
            ),
            SizedBox(width: 10.w,),
            Image.asset(icon!.toString(),height: 16.h,width: 14.w,),
          ],
        ),
      ),
      onTap: func!,
    );
  }
}
