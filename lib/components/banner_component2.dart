import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/style/AppColors.dart';

class banner_component2 extends StatelessWidget {
  const banner_component2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 393.w,
      height: 185.h,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Container(
            height: 100.h,
            width: 160.w,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40.r),
                  bottomRight: Radius.circular(40.r)),
              // shape: BoxShape.circle,
            ),
            child: Image.asset(
              'asset/phone.png',
              height: 154.h,
              width: 148.w,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w, bottom: 5.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Made Renting Asan!',
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'students can quickly contact hostel owners.\nAnd able to select their preferred place instantly',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 9.sp),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
