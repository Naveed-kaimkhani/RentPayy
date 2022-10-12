import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/auth_screens_decor.dart';

class Hostel_Signup extends StatefulWidget {
  const Hostel_Signup({Key? key}) : super(key: key);

  @override
  State<Hostel_Signup> createState() => _Hostel_SignupState();
}

class _Hostel_SignupState extends State<Hostel_Signup> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF5AD0D),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 23, top: 34),
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.keyboard_backspace_rounded,
                      color: Colors.black,
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0, 1),
                  child: Container(
                    margin: EdgeInsets.only(top: 110.h),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: auth_screens_decor(),
                    child: Padding(
                      padding: EdgeInsets.only(left: 28, right: 28),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: const Text(
                              "Hostel Signup",
                              style: TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 12),
                            child: TextField(
                              decoration: InputDecoration(
                                filled: true,
                                hintText: "Enter your name",
                                fillColor: Color(0xffF4F7FF),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 17),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 12),
                            child: TextField(
                              decoration: InputDecoration(
                                filled: true,
                                hintText: "Enter your name",
                                fillColor: Color(0xffF4F7FF),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 17),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 12),
                            child: TextField(
                              decoration: InputDecoration(
                                prefixIcon: Container(
                                  width: 60,
                                  height: 40,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("+92"),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      VerticalDivider(),
                                    ],
                                  ),
                                ),
                                filled: true,
                                fillColor: Color(0xffF4F7FF),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 17),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 12),
                            child: TextField(
                              decoration: InputDecoration(
                                filled: true,
                                hintText: "Enter your name",
                                fillColor: Color(0xffF4F7FF),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 17),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 12),
                            child: TextField(
                              decoration: InputDecoration(
                                filled: true,
                                hintText: "Enter your name",
                                fillColor: Color(0xffF4F7FF),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 17),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 12),
                            child: TextField(
                              decoration: InputDecoration(
                                prefixIcon: Container(
                                  width: 60,
                                  height: 40,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("+92"),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      VerticalDivider(),
                                    ],
                                  ),
                                ),
                                filled: true,
                                fillColor: Color(0xffF4F7FF),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 17),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 12),
                            child: TextField(
                              decoration: InputDecoration(
                                filled: true,
                                hintText: "Enter your name",
                                fillColor: Color(0xffF4F7FF),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 17),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 12),
                            child: TextField(
                              decoration: InputDecoration(
                                filled: true,
                                hintText: "Enter your name",
                                fillColor: Color(0xffF4F7FF),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 17),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 12),
                            child: CupertinoButton(
                                padding: EdgeInsets.only(left: 30, right: 30,),
                                color: Color(0xffF5AD0D),
                                child: Container(
                                  width: 58,

                                  child: Row(
                                    children: [
                                      Text("Next"),
                                      Icon(Icons.arrow_forward_rounded),
                                    ],
                                  ),
                                ),
                                onPressed: () {}),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
