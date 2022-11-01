import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/utils/routes/RoutesName.dart';

import '../../components/authButton.dart';
import '../../components/auth_screens_decor.dart';
import '../../components/custom_appbar.dart';
import '../../components/or_line_widget.dart';
import '../../components/terms_and_condition.dart';
import '../../utils/style/AppColors.dart';
import '../../utils/style/Images.dart';

class login_screen extends StatelessWidget {
  login_screen({Key? key}) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const custom_appbar(),
        backgroundColor: AppColors.primaryColor,
        body: Container(
          color: AppColors.primaryColor,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Container(
            decoration: auth_screens_decor(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 39,
                  ),
                  Container(
                      height: 52.86.h,
                      width: 135.w,
                      child: Image.asset(Images.mainicon)),
                  // EdgeInsets.symmetric(horizontal: 54.w, vertical: 170.h),
                  SizedBox(
                    height: 76.14.h,
                  ),
                  authButton(
                    text: "Login",
                    color: Colors.black,
                    func: () {
                      Navigator.pushNamed(
                          context, RoutesName.loginWithRentPayy);
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  authButton(
                    text: "Sign Up",
                    color: AppColors.primaryColor,
                    func: () {
                      Navigator.pushNamed(context, RoutesName.userSignup);
                    },
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  or_line_widget(),
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
                  terms_and_conditions()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
