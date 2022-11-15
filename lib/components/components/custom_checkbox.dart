import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/utils/style/AppColors.dart';

class Custom_Checkbox extends StatefulWidget {
  String? text;
  Custom_Checkbox({required this.text, Key? key}) : super(key: key);

  @override
  State<Custom_Checkbox> createState() => _Custom_CheckboxState();
}

class _Custom_CheckboxState extends State<Custom_Checkbox> {
  bool isselected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 160.w,
        height: 51.2.h,
        decoration: BoxDecoration(
          color: AppColors.textfieldsColor,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 14.w,
            ),
            isselected
                ? Container(
                    width: 31.w,
                    height: 31.h,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Center(
                      child: Image.asset("asset/check.png"),
                    ),
                  )
                : Container(
                    width: 31.w,
                    height: 31.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                    ),
              child: Image.asset("asset/uncheck.png"),
                  ),
            SizedBox(
              width: 21.w,
            ),
            Text(
              widget.text!,
              style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
      onTap: () {
        setState(() {
          isselected = !isselected;
        });
      },
    );
  }
}
