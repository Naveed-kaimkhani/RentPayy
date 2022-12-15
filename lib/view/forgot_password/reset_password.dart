import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/components/authButton.dart';
import 'package:rentpayy/components/auth_screens_decor.dart';
import 'package:rentpayy/components/custom_appbar.dart';
import 'package:rentpayy/components/inputfields.dart';
import 'package:rentpayy/components/passfield.dart';
import 'package:rentpayy/utils/style/AppColors.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FocusNode passwordFocusNode = FocusNode();
    FocusNode confirmPasswordFocusNode = FocusNode();
    final TextEditingController _passworController = TextEditingController();
    final TextEditingController _confirmPasswordController =
        TextEditingController();
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
                'Reset Password',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 26.sp),
              ),
              Padding(
                padding: EdgeInsets.only(left: 42.w, right: 42.w, top: 27.h),
                child: Text(
                  'Set the new password for your account so you can ',
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
                ),
              ),
              Text(
                'login and access all the features',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 63.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 29.w),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('New Password'),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.only(left: 29.w, right: 29.w, top: 7.h),
              //   child: TextFormField(
              //     controller: _passworController,
              //     decoration: InputDecoration(
              //       hintText: 'Enter your email',
              //       hintStyle:
              //       TextStyle(fontWeight: FontWeight.w300, fontSize: 17.sp),
              //       fillColor: Color(0xffF4F7FF),
              //       filled: true,
              //       border: InputBorder.none,
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 7.h,
              ),
              passfield(
                hint_text: '',
                currentNode: passwordFocusNode,
                focusNode: passwordFocusNode,
                nextNode: passwordFocusNode,
                controller: _passworController,
                icon: Icon(Icons.visibility_rounded),
              ),
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 29.w),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Confirm Password'),
                ),
              ),
              SizedBox(height: 7.h,),
              passfield(
                  hint_text: '',
                  currentNode: confirmPasswordFocusNode,
                  focusNode: confirmPasswordFocusNode,
                  nextNode: confirmPasswordFocusNode,
                  controller: _confirmPasswordController,
              ),
              SizedBox(height: 29.h,),
              authButton(text: 'Reset Password', func: (){}, color: AppColors.primaryColor),
            ],
          ),
        ),
      ),
    );
  }
}
