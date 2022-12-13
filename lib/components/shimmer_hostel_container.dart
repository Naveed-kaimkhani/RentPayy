import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class shimmer_hostel_container extends StatelessWidget {
  shimmer_hostel_container({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 18.sp,
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.withOpacity(0.5),
        highlightColor: Colors.white,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 125.h,
                  width: 187.w,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25.r),
                          topLeft: Radius.circular(25.r))),
                ),
              ],
            ),
            SizedBox(
              height: 6.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 9.w, right: 8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 17.67.h,
                    width: 90.w,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(7.r),
                    ),
                  ),
                  // SizedBox(width: 12.sp,),
                  Container(
                    height: 17.67.h,
                    width: 70.w,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(7.r),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 6.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 9.w),
              child: Row(
                children: [
                  Container(
                    height: 17.67.h,
                    width: 90.w,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(7.r),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 9.w, top: 7.41.h,right: 8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 17.67.h,
                    width: 90.w,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(7.r),
                    ),
                  ),
                  Container(
                    height: 17.67.h,
                    width: 70.w,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(7.r),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
