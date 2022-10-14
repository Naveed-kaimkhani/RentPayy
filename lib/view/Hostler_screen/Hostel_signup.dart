import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/components/custom_appbar.dart';
import 'package:rentpayy/components/inputfields.dart';
import 'package:rentpayy/utils/style/AppColors.dart';

import '../../components/auth_screens_decor.dart';
import '../../components/mini_Button.dart';

class Hostel_Signup extends StatefulWidget {
  const Hostel_Signup({Key? key}) : super(key: key);

  @override
  State<Hostel_Signup> createState() => _Hostel_SignupState();
}

class _Hostel_SignupState extends State<Hostel_Signup> {
  FocusNode nameFocusNode = FocusNode();
  FocusNode hosteladdrFocusNode = FocusNode();
  FocusNode hostelOwnernameFocusNode = FocusNode();
  FocusNode hostelOwnercontactFocusNode = FocusNode();
  FocusNode hostelOwneraddressFocusNode = FocusNode();
  FocusNode hostelcontactFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmpasswordFocusNode = FocusNode();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _hostelcontactController = TextEditingController();
  TextEditingController _hostelOwnernameController = TextEditingController();
  TextEditingController _hostelOwnerphoneController = TextEditingController();
  TextEditingController _hostelOwneraddressController = TextEditingController();
  TextEditingController _hosteladdressController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: custom_appbar(),
        body: Stack(
          children: [
            Container(
              color: AppColors.primaryColor,
              child: Container(
                decoration: auth_screens_decor(),
                child: Padding(
                  padding: EdgeInsets.only(left: 28.h, right: 28.h, top: 10.h),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 48.h,
                        ),
                        const Text(
                          "Hostel Signup",
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 28.h,
                        ),
                        inputfields(
                            hint_text: "Enter Hostel name",
                            currentNode: nameFocusNode,
                            focusNode: nameFocusNode,
                            nextNode: hosteladdrFocusNode,
                            controller: _nameController),
                        SizedBox(
                          height: 16.h,
                        ),
                        inputfields(
                            hint_text: "Enter Hostel address",
                            currentNode: hosteladdrFocusNode,
                            focusNode: hosteladdrFocusNode,
                            nextNode: hostelcontactFocusNode,
                            controller: _hosteladdressController),
                        SizedBox(
                          height: 16.h,
                        ),
                        inputfields(
                          hint_text: "Hostel Contact number",
                          currentNode: hostelcontactFocusNode,
                          focusNode: hostelcontactFocusNode,
                          nextNode: hostelOwnernameFocusNode,
                          controller: _hostelcontactController,
                          preicon: Container(
                            width: 60.h,
                            height: 60.h,
                            child: Row(
                              children: [
                                Text(
                                  "+92",
                                  style: TextStyle(fontSize: 17),
                                ),
                                VerticalDivider(
                                  thickness: 2,
                                  color: Colors.grey.shade700,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        inputfields(
                            hint_text: "Hostel Owner name",
                            currentNode: hostelOwnernameFocusNode,
                            focusNode: hostelOwnernameFocusNode,
                            nextNode: hostelOwneraddressFocusNode,
                            controller: _hostelOwnernameController),
                        SizedBox(
                          height: 16.h,
                        ),
                        inputfields(
                            hint_text: "Hostel Owner address",
                            currentNode: hostelOwneraddressFocusNode,
                            focusNode: hostelOwneraddressFocusNode,
                            nextNode: hostelOwnercontactFocusNode,
                            controller: _hostelOwneraddressController),
                        SizedBox(
                          height: 16.h,
                        ),
                        inputfields(
                          hint_text: "Owner phone number",
                          currentNode: hostelOwnercontactFocusNode,
                          focusNode: hostelOwnercontactFocusNode,
                          nextNode: passwordFocusNode,
                          controller: _hostelOwnerphoneController,
                          preicon: Container(
                            width: 60.h,
                            height: 60.h,
                            child: Row(
                              children: [
                                Text(
                                  "+92",
                                  style: TextStyle(fontSize: 17),
                                ),
                                VerticalDivider(
                                  thickness: 2,
                                  color: Colors.grey.shade700,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        inputfields(
                            hint_text: "Set Password",
                            currentNode: passwordFocusNode,
                            focusNode: passwordFocusNode,
                            nextNode: confirmpasswordFocusNode,
                            controller: _passwordController),
                        SizedBox(
                          height: 16.h,
                        ),
                        inputfields(
                          hint_text: "Confirm Password",
                          currentNode: confirmpasswordFocusNode,
                          focusNode: confirmpasswordFocusNode,
                          nextNode: confirmpasswordFocusNode,
                          controller: _confirmpasswordController,
                          icon: Icon(Icons.remove_red_eye),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: MiniButton(
                              text: 'Next',
                              func: () {},
                              color: AppColors.primaryColor,
                              icon: Icons.arrow_forward_rounded),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
