import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/utils/routes/RoutesName.dart';
import 'package:rentpayy/utils/style/AppColors.dart';

import '../../components/authButton.dart';

class confirm_bookings extends StatelessWidget {
  const confirm_bookings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              " Booked Successfully ",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 29.sp),
            ),
            SizedBox(
              height: 50.h,
            ),
            Center(
              child: Image.asset(
                "asset/confirm.png",
                height: 300,
                width: 300,
              ),
            ),
            SizedBox(
              height: 42.h,
            ),
            // InkWell(
            //     child: Container(
            //       height: 67.h,
            //       width: 321.w,
            //       decoration: BoxDecoration(
            //         color: AppColors.primaryColor,
            //         borderRadius: BorderRadius.circular(12.r),
            //       ),
            //       child: Center(
            //         child: Text(
            //           "Back to Home",
            //           style: TextStyle(
            //               fontWeight: FontWeight.w500,
            //               color: Colors.white,
            //               fontSize: 17.sp),
            //         ),
            //       ),
            //     ),
            //     onTap: () {
            //       //   bool flag = utils.checkConnectivity(context);

            //       //   if (flag) {
            //       //   } else {
            //       //     Navigator.pop(context);
            //       //   }
            //       // },
            //       Navigator.pushNamed(context, RoutesName.user_front_screen);
            //     }),
            authButton(
                // text: "Continue to Payment",
                text: "Back to Home",
                func: () {
                  Navigator.pushNamed(context, RoutesName.navigation_page);
                },
                color: AppColors.primaryColor)
          ],
        ),
      ),
    );
  }
}
