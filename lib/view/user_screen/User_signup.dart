import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/components/authButton.dart';
import 'package:rentpayy/components/custom_appbar.dart';
import 'package:rentpayy/components/inputfields.dart';
import 'package:rentpayy/utils/StorageService.dart';
import 'package:rentpayy/utils/routes/RoutesName.dart';
import '../../components/auth_screens_decor.dart';
import 'package:rentpayy/utils/utils.dart';
import '../../model/UserModel.dart';
import '../../resources/FirebaseRepository.dart';
import '../../utils/style/AppColors.dart';

class User_signup_page extends StatefulWidget {
  const User_signup_page({Key? key}) : super(key: key);

  @override
  State<User_signup_page> createState() => _User_signup_pageState();
}

class _User_signup_pageState extends State<User_signup_page> {
  final FirebaseRepository _firebaseRepository = FirebaseRepository();

  @override
  void initState() {
    super.initState();
  }

  FocusNode emailFocusNode = FocusNode();
  FocusNode nameFocusNode = FocusNode();
  FocusNode numberFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmpasswordFocusNode = FocusNode();
  FocusNode ageFocusNode = FocusNode();
  FocusNode dropdownFocusNode = FocusNode();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmpasswordController = TextEditingController();

  bool? obsecureText =false;
  List<String> genderList = ["Male", "Female"];
  String? selectedvalue = "Gender";
  File? _profileImage;
  bool isLoadingNow = false;

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _numberController.dispose();
    _ageController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }

  void isLoading(bool value) {
    setState(() {
      isLoadingNow = value;
    });
  }

  void _validateFields() {
    if (_nameController.text.trim().isEmpty &&
        // _workTypeController.text.trim().isEmpty &&

        _numberController.text.trim().isEmpty &&
        _emailController.text.trim().isEmpty &&
        _passwordController.text.trim().isEmpty &&
        _confirmpasswordController.text.trim().isEmpty &&
        _confirmpasswordController.text.trim().isEmpty &&
        _ageController.text.trim().isEmpty) {
      utils.flushBarErrorMessage('Enter your complete details', context);
    } else if (_nameController.text.trim().isEmpty) {
      utils.flushBarErrorMessage('Enter your full name', context);
    } else if (_numberController.text.trim().isEmpty) {
      utils.flushBarErrorMessage('Enter your phone', context);
    } else if (_emailController.text.trim().isEmpty) {
      utils.flushBarErrorMessage('Enter your email', context);
    } else if (_numberController.text.length != 11) {
      utils.flushBarErrorMessage('Invalid Phone Number', context);
    } else if (_passwordController.text.trim().isEmpty) {
      utils.flushBarErrorMessage('Enter your password', context);
    } else if (_confirmpasswordController.text.trim().isEmpty) {
      utils.flushBarErrorMessage(
          'Enter your password again to confirm', context);
    } else if (!EmailValidator.validate(_emailController.text)) {
      utils.flushBarErrorMessage('Invalid Email', context);
    } else if (_passwordController.text != _confirmpasswordController.text) {
      utils.flushBarErrorMessage('Enter same password to confirm', context);
    } else if (_profileImage == null) {
      utils.flushBarErrorMessage('Please upload a profile picture', context);
    } else {
      // Regex for Pakistani number (+92 123 4567890)
      // if (!RegExp(r'^(?:[+0]9)?[0-9]{10}$').hasMatch(_phoneController.text)) {
      isLoading(true);
      UserModel userModel = UserModel(
        name: _nameController.text.trim(),
        phone: _numberController.text.trim(),
        email: _emailController.text.trim(),
        gender: selectedvalue!.trim(),
        age: _ageController.text.trim(),
      );
      _signup(userModel);
    }
  }

  void _signup(UserModel userModel) {
    _firebaseRepository
        .signUp(
      _emailController.text,
      _passwordController.text,
    )
        .then((User? user) async {
      if (user != null) {
        userModel.uid = user.uid;
        userModel.uid = user.uid;
        userModel.profileImage = await _firebaseRepository.uploadProfileImage(
            imageFile: _profileImage!, uid: userModel.uid!);
        _saveUser(user, userModel);
      } else {
        isLoading(false);
        utils.flushBarErrorMessage('Failed to Signup', context);
      }
    }).catchError((error) {
      isLoading(false);
      utils.flushBarErrorMessage(error.message.toString(), context);
    });
  }

  void _saveUser(User firebaseUser, UserModel userModel) {
    _firebaseRepository.saveUserDataToFirestore(userModel).then((value) {
      StorageService.saveUser(userModel).then((value) {
        isLoading(false);
        Navigator.pushNamed(context, RoutesName.loginWithRentPayy);
      });
    }).catchError((error) {
      isLoading(false);
      utils.flushBarErrorMessage(error.message.toString(), context);
    });
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
                  padding: EdgeInsets.only(left: 28.w, right: 28.w),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 38.h,
                        ),
                        Text(
                          "User Signup",
                          style: TextStyle(
                              fontSize: 26.sp, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        CircleAvatar(
                          minRadius: 50.r,
                          maxRadius: 50.r,
                          backgroundImage: const AssetImage("asset/avatar.png"),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              width: 36.w,
                              height: 36.h,
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              child: Container(
                                width: 20.w,
                                height: 20.h,
                                child: Container(
                                  child: Image.asset('asset/gallery.png'),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.16.h,
                        ),
                        inputfields(
                          hint_text: "Enter name",
                          currentNode: nameFocusNode,
                          focusNode: nameFocusNode,
                          nextNode: numberFocusNode,
                          controller: _nameController,
                          obsecureText: false,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        inputfields(
                          hint_text: "Enter phone number",
                          currentNode: numberFocusNode,
                          focusNode: numberFocusNode,
                          nextNode: ageFocusNode,
                          controller: _numberController,
                          obsecureText: false,
                          preicon: Container(
                            width: 60.w,
                            height: 60.h,
                            child: Row(
                              children: [
                                Text(
                                  "+92",
                                  style: TextStyle(fontSize: 17.sp),
                                ),
                                VerticalDivider(
                                  thickness: 2.r,
                                  color: Colors.grey.shade700,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Row(
                          children: [
                            // Container(
                            //   width: 185.w,
                            //   height: 60.h,
                            //   decoration: BoxDecoration(
                            //     color: AppColors.textfieldsColor,
                            //     borderRadius: BorderRadius.circular(7.r),
                            //   ),
                            //   child: DropdownButtonHideUnderline(
                            //     child: DropdownButton2(
                            //       buttonElevation: 0,
                            //       dropdownElevation: 0,
                            //       itemHeight: 40,
                            //       icon: Icon(
                            //         Icons.arrow_drop_down,
                            //         color: AppColors.primaryColor,
                            //       ),
                            //       focusNode: dropdownFocusNode,
                            //       hint: Text(
                            //         selectedvalue!,
                            //         style: TextStyle(color: Colors.black),
                            //       ),
                            //       buttonWidth: 150,
                            //       dropdownDecoration: BoxDecoration(
                            //           borderRadius: BorderRadius.circular(7.r),
                            //           color: AppColors.textfieldsColor),
                            //       items: genderList
                            //           .map(
                            //             (value) => DropdownMenuItem<String>(
                            //               value: value,
                            //               child: Text(value),
                            //             ),
                            //           )
                            //           .toList(),
                            //       onChanged: (value) {
                            //         setState(() {
                            //           selectedvalue = value as String;
                            //         });
                            //       },
                            //     ),
                            //   ),
                            // ),
                            SizedBox(
                              width: 7.w,
                            ),
                            Expanded(
                              child: Container(
                                height: 60.h,
                                width: 179.w,
                                decoration: BoxDecoration(
                                    color: AppColors.textfieldsColor,
                                    borderRadius: BorderRadius.circular(7.r)),
                                child: TextField(
                                  // keyboardType: keyboardType,
                                  onEditingComplete: () =>
                                      utils.fieldFocusChange(context,
                                          ageFocusNode, emailFocusNode),
                                  controller: _ageController,
                                  cursorColor: Colors.black,
                                  focusNode: ageFocusNode,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.r),
                                      borderSide: BorderSide(
                                          color: AppColors.primaryColor,
                                          width: 1.0),
                                    ),
                                    border: InputBorder.none,
                                    hintText: "Age",
                                    hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17.sp,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        inputfields(
                          hint_text: "Enter email address",
                          currentNode: emailFocusNode,
                          focusNode: emailFocusNode,
                          nextNode: passwordFocusNode,
                          controller: _emailController,
                          obsecureText: false,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        inputfields(
                          hint_text: "Set password",
                          currentNode: passwordFocusNode,
                          focusNode: passwordFocusNode,
                          nextNode: confirmpasswordFocusNode,
                          controller: _passwordController,
                          obsecureText: true,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        inputfields(
                          hint_text: "Confirm password",
                          currentNode: confirmpasswordFocusNode,
                          focusNode: confirmpasswordFocusNode,
                          nextNode: confirmpasswordFocusNode,
                          controller: _confirmpasswordController,
                          icon: obsecureText! ? Icons.remove_red_eye : Icons.visibility_off ,
                          obsecureText: obsecureText,
                            onIconPress: () {
                          setState(() {
                            obsecureText = !obsecureText!;
                          });
                        }
                        ),
                        SizedBox(
                          height: 31.h,
                        ),
                        authButton(
                          text: isLoadingNow ? "Please wait..." : "Sign Up",
                          color: Color(0xffF5AD0D),
                          func: () {
                            _validateFields();
                          },
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
    );
  }
}
