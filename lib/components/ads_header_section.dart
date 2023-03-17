import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/components/profilePic.dart';
import '../utils/style/AppColors.dart';

class HeaderSection extends StatelessWidget {
  final hostelName;
  final hostelAddress;
  const HeaderSection({
    Key? key,
    required this.Size,
    required this.hostelAddress,
    required this.hostelName,
    required this.ImageUrl,
  }) : super(key: key);

  final Size;
  // final hostelName;
  final ImageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 397.w,
      width: Size.width,
      height: 160.h,
      child: Stack(
        children: [
          Container(
            // width: 397.w,
            width: Size.width,
            height: 145.h,
            decoration: BoxDecoration(
              color: Color.fromRGBO(242, 246, 255, 1),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35.r),
                  topRight: Radius.circular(35.r)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 17.h, left: 14.w),
                  child: Row(
                    children: [
                      Text(
                        hostelAddress,
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Container(
                          height: 15.h,
                          width: 15.w,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(3.r),
                          ),
                          child: Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                            size: 10,
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 14.w, right: 15.w, top: 26.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            hostelName,
                            // "fdlkfjdlfjdkljfdlj",
                            style: TextStyle(
                                color: Color(0xff000000),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Welcome back, Ready to Rent?',
                            style: TextStyle(
                                color: Color(0xff000000),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                      profilePic(url: ImageUrl, height: 61.h, width: 61.w)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
