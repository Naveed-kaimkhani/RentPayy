import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rentpayy/components/authButton.dart';
import 'package:rentpayy/components/custom_appbar.dart';
import 'package:rentpayy/components/inputfields.dart';
import '../../components/auth_screens_decor.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:rentpayy/utils/utils.dart';
import '../../utils/style/AppColors.dart';

class User_signup_page extends StatefulWidget {
  const User_signup_page({Key? key}) : super(key: key);

  @override
  State<User_signup_page> createState() => _User_signup_pageState();
}

class _User_signup_pageState extends State<User_signup_page> {
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

  List<String> items = ["Male", "Female"];
  String selectedvalue = "Male";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: custom_appbar(),
        backgroundColor: Color(0xffF5AD0D),
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: auth_screens_decor(),
              child: Padding(
                padding: EdgeInsets.only(left: 28, right: 28),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 38.h,
                      ),
                      const Text(
                        "User Signup",
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      CircleAvatar(
                        minRadius: 50,
                        maxRadius: 50,
                        backgroundImage: const AssetImage("asset/avatar.png"),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            width: 28.h,
                            height: 28.h,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Container( width: 20,
                              height: 20,
                              child: Container(
                                child: SvgPicture.asset('asset/gallery.svg'),
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
                          controller: _nameController),
                      SizedBox(
                        height: 16,
                      ),
                      inputfields(
                          hint_text: "Enter phone number",
                          currentNode: numberFocusNode,
                          focusNode: numberFocusNode,
                          nextNode: ageFocusNode,
                          controller: _numberController),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 185.h,
                            height: 60.h,
                            decoration: BoxDecoration(
                              color: Color(0xffF4F7FF),
                              borderRadius: BorderRadius.circular(7.h),
                            ),
                            child: DropdownButton2(
                              focusNode: dropdownFocusNode,
                              hint: Text(
                                selectedvalue,
                                style: TextStyle(color: Colors.black),
                              ),
                              buttonWidth: 150,
                              dropdownDecoration:
                                  BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.h),
                                      color:AppColors.textfieldsColor),
                              items: items
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: TextStyle(
                                            fontSize: 14,

                                            color: Colors.black,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ))
                                  .toList(),
                              value: selectedvalue,
                              onChanged: (value) {
                                setState(() {
                                  selectedvalue = value as String;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 7.h,
                          ),
                          Expanded(
                            child: Container(
                              height: 60.h,
                              width: 179.w,
                              decoration: BoxDecoration(
                                color: AppColors.textfieldsColor,
                                borderRadius: BorderRadius.circular(12.r)),
                              child: TextField(
                                // keyboardType: keyboardType,
                                onEditingComplete:()=> utils.fieldFocusChange(context, ageFocusNode, emailFocusNode),
                                controller: _ageController,
                                cursorColor: Colors.black,
                                focusNode: ageFocusNode,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.r),
                                      borderSide: BorderSide(color: AppColors.primaryColor, width: 1.0),
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
                      ),SizedBox(
                        height: 16,
                      ),
                      inputfields(
                          hint_text: "Enter email address",
                          currentNode: emailFocusNode,
                          focusNode: emailFocusNode,
                          nextNode: passwordFocusNode,
                          controller: _emailController),
                      SizedBox(
                        height: 16,
                      ),
                      inputfields(
                          hint_text: "Set password",
                          currentNode: passwordFocusNode,
                          focusNode: passwordFocusNode,
                          nextNode: confirmpasswordFocusNode,
                          controller: _passwordController),
                      SizedBox(
                        height: 16,
                      ),
                      inputfields(
                          hint_text: "Confirm password",
                          currentNode: confirmpasswordFocusNode,
                          focusNode: confirmpasswordFocusNode,
                          nextNode: confirmpasswordFocusNode,
                          controller: _confirmpasswordController),
                      SizedBox(
                        height: 31.h,
                      ),
                      authButton(
                        text: "Sign Up",
                        color: Color(0xffF5AD0D),
                        func: () {},
                      )
                    ],
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
