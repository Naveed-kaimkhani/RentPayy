import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/components/authButton.dart';
import 'package:rentpayy/utils/style/AppColors.dart';
import 'package:rentpayy/utils/style/Images.dart';

class publish_ad_screen extends StatelessWidget {
  const publish_ad_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 230.h,
              ),
              Image.asset(Images.checkImage),
              SizedBox(
                height: 14.h,
              ),
              Text(
                'Success!',
                style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Your ad is successfully published on our ',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp),
              ),
              Text(
                'application',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp),
              ),
              SizedBox(
                height: 26.h,
              ),
              authButton(
                  text: 'Go to home',
                  func: () {},
                  color: AppColors.primaryColor),
            ],
          ),
        ),
      ),
    );
  }
}