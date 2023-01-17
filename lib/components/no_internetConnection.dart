import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/utils/style/AppColors.dart';

class no_internetConnection extends StatelessWidget {
  const no_internetConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset("asset/NoInternet.png"),
            ),
            SizedBox(
              height: 26.h,
            ),
            Text(
              "Ooops!",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 29.sp),
            ),
            SizedBox(
              height: 14.h,
            ),
            Text(
                "You are not connected to the internet\n Please check your interent connection"),
            SizedBox(
              height: 42.h,
            ),
            InkWell(
              child: Container(
                height: 67.h,
                width: 321.w,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Center(
                  child: Text(
                    "Try Again",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 17.sp),
                  ),
                ),
              ),
              onTap: () {
              //   bool flag = utils.checkConnectivity(context);

              //   if (flag) {
              //   } else {
              //     Navigator.pop(context);
              //   }
              // },
                                Navigator.pop(context);
              }
            ),
          ],
        ),
      ),
    );
  }
}
