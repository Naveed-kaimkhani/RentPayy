import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/components/authButton.dart';
import 'package:rentpayy/components/auth_screens_decor.dart';
import 'package:rentpayy/components/custom_appbar.dart';
import 'package:rentpayy/components/inputfields.dart';
import '../../utils/style/AppColors.dart';

class forgot_password extends StatelessWidget {
  forgot_password({Key? key}) : super(key: key);

  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: custom_appbar(),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: AppColors.primaryColor,
            child: Container(
              decoration: auth_screens_decor(),
              child: Padding(
                padding: EdgeInsets.only(left: 41.w, right: 41.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 32.h,
                    ),
                    Text(
                      "Forgot Password",
                      style: TextStyle(
                          fontSize: 26.sp, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 27.h,
                    ),
                    Text(
                      "Enter your email address and we will send a code to reset your password. ",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 67.h,
                    ),
                    inputfields(
                      hint_text: "Enter your email",
                      focusNode: null,
                      nextNode: null,
                      controller: _emailController,
                      currentNode: null,
                    ),
                    SizedBox(
                      height: 19.h,
                    ),
                    authButton(
                        text: "Send Code",
                        func: () {},
                        color: AppColors.primaryColor),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
