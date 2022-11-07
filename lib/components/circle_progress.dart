import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/utils/style/AppColors.dart';

class circle_progress extends StatelessWidget {
  const circle_progress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 157.w,
      height: 67.h,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Please wait",
              style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            SizedBox(
              height: 25,
              width: 25,
              child: CircularProgressIndicator(
                strokeWidth: 3.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
