import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/components/authButton.dart';
import 'package:rentpayy/components/auth_screens_decor.dart';
import 'package:rentpayy/components/custom_appbar.dart';
import 'package:rentpayy/utils/style/AppColors.dart';
import 'package:rentpayy/utils/style/Images.dart';

import '../user_screen/login_screen.dart';

class PasswordChangedScreen extends StatelessWidget {
  const PasswordChangedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: custom_appbar(),
        body: Container(
          height: 844.h,
          width: 428.w,
          decoration: auth_screens_decor(),
          child: Column(
            children: [
              SizedBox(
                height: 101.h,
              ),
              Image.asset(Images.checkImage),
              SizedBox(
                height: 39.h,
              ),
              Text(
                'Password Changed!',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 26.sp),
              ),
              SizedBox(
                height: 11.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 42.w, right: 42.w, top: 27.h),
                child: Text(
                  'Your password has been changed ',
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
                ),
              ),
              Text(
                'Successfully.',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 20.h,
              ),
              authButton(
                text: 'Back to Login',
                func: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => login_screen()));
                },
                color: AppColors.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
