import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/components/authButton.dart';
import 'package:rentpayy/components/auth_screens_decor.dart';
import 'package:rentpayy/components/custom_appbar.dart';
import 'package:rentpayy/components/inputfields.dart';
import 'package:rentpayy/components/or_line_widget.dart';
import 'package:rentpayy/components/terms_and_condition.dart';
import 'package:rentpayy/utils/style/AppColors.dart';

import '../../utils/style/Images.dart';

class login_with_rentpayy extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  TextEditingController _passController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  login_with_rentpayy({super.key});
  void dispose() {
    _emailController.dispose();
    _passController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const custom_appbar(),
        body: Container(
          color: AppColors.primaryColor,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: auth_screens_decor(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 36.h,),
                  Text(
                    "Login",
                    style:
                        TextStyle(fontSize: 26.sp, fontWeight: FontWeight.w500),
                  ),SizedBox(height:73.h,),
                  inputfields(
                    hint_text: "  Email",
                    controller: _emailController,
                    focusNode: emailFocusNode,
                    icon: Icon(Icons.remove),
                    currentNode: emailFocusNode,
                    nextNode: passwordFocusNode,
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  inputfields(
                    hint_text: "  Password",
                    controller: _passController,
                    focusNode: passwordFocusNode,
                    icon: Icon(Icons.remove_red_eye),
                    currentNode: passwordFocusNode,
                    nextNode: passwordFocusNode,
                  ),
                  SizedBox(height: 38.h,),
                  authButton(
                      text: "Login", func: () {}, color: AppColors.primaryColor),
                  SizedBox(height: 73.h,),
                  or_line_widget(),
                  Container(width: 349.w,
                    height: 53.h,
                    child: Image.asset(
                      Images.google,
                    ),
                  ),
                  SizedBox(height: 17.h,),
                  Container(
                    width: 349.w,
                      height: 53.h,
                      child: Image.asset(Images.facebook)),
                  SizedBox(
                    height: 120.h,
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
