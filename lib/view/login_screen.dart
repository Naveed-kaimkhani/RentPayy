import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rentpayy/utils/routes/RoutesName.dart';
import 'package:rentpayy/utils/utils.dart';

import '../components/authButton.dart';
import '../components/auth_screens_decor.dart';
import '../components/custom_appbar.dart';
import '../utils/style/AppColors.dart';
import '../utils/style/Images.dart';

class login_screen extends StatelessWidget {
  login_screen({Key? key}) : super(key: key);
 
  @override
  void dispose() {


  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const custom_appbar(),
        backgroundColor: AppColors.primaryColor,
        body: Container(
          margin: EdgeInsets.only(top: 32.h),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: auth_screens_decor(),
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 147.w, vertical: 39.h),
              child: Image.asset(Images.mainicon),
            ),
            // EdgeInsets.symmetric(horizontal: 54.w, vertical: 170.h),
            SizedBox(
              height: 60.h,
            ),
            authButton(
              text: "Login",
              color: Colors.black,
              func: () {},
            ),
            SizedBox(
              height: 15.h,
            ),
            authButton(
              text: "Sign Up",
              color: AppColors.primaryColor,
              func: () {},
            ),
            SizedBox(
              height: 80.h,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(Images.line),
                  Image.asset(Images.or),
                  Image.asset(Images.line),
                ],
              ),
            ),
            // Container(
            //   height: 80.h,
            //   width: 321.w,
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(10),
            //     border: Border.all(color: Colors.black, width: 2),
            //     // border: BoxBorder()
            //   ),
            // ),
            Image.asset(
              Images.google,
              height: 76.h,
              width: 321.w,
            ),
            SizedBox(
              height: 20.h,
            ),
            Image.asset(
              Images.facebook,
              height: 76.h,
              width: 321.w,
            ),
            SizedBox(
              height: 58.h,
            ),
            Text(
              "If you continue, you are accepting RentPayy Terms and Conditions\n                                         and Privacy Policy",
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w300,
              ),
            )
          ],
        ),
          ),
        ),
      ),
    );
  }

}
