import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/components/authButton.dart';
import 'package:rentpayy/components/custom_appbar.dart';
import 'package:rentpayy/components/inputfields.dart';
import 'package:rentpayy/utils/style/AppColors.dart';

import '../../components/auth_screens_decor.dart';

class Hostel_Signup extends StatefulWidget {
  const Hostel_Signup({Key? key}) : super(key: key);

  @override
  State<Hostel_Signup> createState() => _Hostel_SignupState();
}

class _Hostel_SignupState extends State<Hostel_Signup> {
  FocusNode emailFocusNode = FocusNode();
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
        body: SizedBox(
          // width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: AppColors.primaryColor,
                child: Container(
                  decoration: auth_screens_decor(),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 28.h, right: 28.h, top: 10.h),
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
                            height: 30.h,
                          ),
                          inputfields(
                              hint_text: "Enter Hostel name",
                              currentNode: nameFocusNode,
                              focusNode: nameFocusNode,
                              nextNode: hosteladdrFocusNode,
                              controller: _nameController),
                          SizedBox(
                            height: 15.h,
                          ),
                          inputfields(
                              hint_text: "Enter Hostel address",
                              currentNode: hosteladdrFocusNode,
                              focusNode: hosteladdrFocusNode,
                              nextNode: hostelcontactFocusNode,
                              controller: _hosteladdressController),
                          SizedBox(
                            height: 15.h,
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
                                  SizedBox(
                                    width: 9.h,
                                  ),
                                  Text("+92"),
                                  VerticalDivider(
                                    thickness: 2,
                                    color: Colors.grey.shade600,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          inputfields(
                              hint_text: "Hostel Owner name",
                              currentNode: hostelOwnernameFocusNode,
                              focusNode: hostelOwnernameFocusNode,
                              nextNode: hostelOwneraddressFocusNode,
                              controller: _hostelOwnernameController),
                          SizedBox(
                            height: 15.h,
                          ),
                          inputfields(
                              hint_text: "Hostel Owner address",
                              currentNode: hostelOwneraddressFocusNode,
                              focusNode: hostelOwneraddressFocusNode,
                              nextNode: hostelOwnercontactFocusNode,
                              controller: _hostelOwneraddressController),
                          SizedBox(
                            height: 15.h,
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
                                  SizedBox(
                                    width: 9.h,
                                  ),
                                  Text("+92"),
                                  VerticalDivider(
                                    thickness: 2,
                                    color: Colors.grey.shade600,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          inputfields(
                              hint_text: "Set Password",
                              currentNode: passwordFocusNode,
                              focusNode: passwordFocusNode,
                              nextNode: confirmpasswordFocusNode,
                              controller: _passwordController),
                          SizedBox(
                            height: 15.h,
                          ),
                          inputfields(
                              hint_text: "Confirm Password",
                              currentNode: confirmpasswordFocusNode,
                              focusNode: confirmpasswordFocusNode,
                              nextNode: confirmpasswordFocusNode,
                              controller: _confirmpasswordController),
                          SizedBox(
                            height: 30.h,
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: Container(
                              width: 157.h,
                              height: 67.h,
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Next",
                                    style: TextStyle(
                                        fontSize: 17.h, color: Colors.white),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_rounded,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
