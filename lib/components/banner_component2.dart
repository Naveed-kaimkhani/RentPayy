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
            height: double.infinity,
            width: 160.w,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40.r),
                  bottomRight: Radius.circular(40.r)),
              // shape: BoxShape.circle,
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  top: 25.h, left: 11.w, right: 25.w, bottom: 23.h),
              child: Image.asset(
                'asset/phone.png',
                height: 137.h,
                width: 128.w,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Made Renting Asan!',
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 21.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor ',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 11.sp),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
