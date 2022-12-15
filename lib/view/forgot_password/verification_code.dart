import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/components/authButton.dart';
import 'package:rentpayy/components/custom_appbar.dart';
import 'package:rentpayy/utils/style/AppColors.dart';
import 'package:pinput/pinput.dart';

import '../../components/auth_screens_decor.dart';

class VerificationCode extends StatelessWidget {
  const VerificationCode({Key? key}) : super(key: key);

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
                height: 32.h,
              ),
              Text(
                'Verification Code',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 26.sp),
              ),
              Padding(
                padding: EdgeInsets.only(left: 42.w, right: 42.w, top: 27.h),
                child: Text(
                  'Enter the 4 digits code that you received on your',
                  style:
                  TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
                ),
              ),
              Text(
                ' email',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 66.h,),
              Pinput(
                length: 4,
                showCursor: true,
                onCompleted: (pin) {},
              ),
              SizedBox(height: 40.h,),
              authButton(text: 'Continue', func: (){}, color: AppColors.primaryColor),
              SizedBox(height: 20.h,),
              Text('Resend Code', style: TextStyle(fontSize: 15.sp , fontWeight: FontWeight.w400),),
            ],
          ),
        ),
      ),
    );
  }
}
