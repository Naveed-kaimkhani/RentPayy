import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/components/authButton.dart';
import 'package:rentpayy/components/auth_screens_decor.dart';
import 'package:rentpayy/components/circle_progress.dart';
import 'package:rentpayy/components/custom_appbar.dart';
import 'package:rentpayy/components/inputfields.dart';
import 'package:rentpayy/utils/routes/RoutesName.dart';
import 'package:rentpayy/utils/utils.dart';
import '../../utils/style/AppColors.dart';

class forgot_password extends StatefulWidget {
  forgot_password({Key? key}) : super(key: key);

  @override
  State<forgot_password> createState() => _forgot_passwordState();
}

class _forgot_passwordState extends State<forgot_password> {
  TextEditingController _emailController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  bool isLoading = false;

  Future<void> sentLink(String email) async {
    if (!EmailValidator.validate(email)) {
      utils.flushBarErrorMessage("Invalid Email", context);
    } else {
      await auth.sendPasswordResetEmail(email: email).then((Value) {
        utils.toastMessage('Sent a link to your Email');
      }).onError((error, stackTrace) {
        utils.flushBarErrorMessage("Something went wrong", context);
      });
    }
  }

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
                    SizedBox(height: 32.h),
                    Text(
                      "Forgot Password",
                      style: TextStyle(
                          fontSize: 26.sp, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 27.h,
                    ),
                    Text(
                      "Enter your email address to get a link to reset your password. ",
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
                    isLoading
                        ? circle_progress()
                        : authButton(
                            text: "Send Code",
                            func: () async {
                              FocusManager.instance.primaryFocus?.unfocus();

                              setState(() {
                                isLoading = true;
                              });
                              Future.delayed(Duration(seconds: 2), () {
                                setState(() {
                                  isLoading = false;
                                });
                              });
                              // _emailController.clear();
                              await sentLink(_emailController.text);
                              _emailController.clear();
                            },
                            color: AppColors.primaryColor,
                          ),
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
