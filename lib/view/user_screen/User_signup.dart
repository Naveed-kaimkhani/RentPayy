import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/auth_screens_decor.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class User_signup_page extends StatefulWidget {
  const User_signup_page({Key? key}) : super(key: key);

  @override
  State<User_signup_page> createState() => _User_signup_pageState();
}

class _User_signup_pageState extends State<User_signup_page> {
  List<String> items = ["Male", "Female"];
  String selectedvalue = "Male";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    padding: const EdgeInsets.only(left: 28, right: 28),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: const Text(
                            "User Signup",
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: CircleAvatar(
                            minRadius: 50,
                            maxRadius: 50,
                            backgroundImage: const AssetImage("asset/avatar.png"),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: const Color(0xffF5AD0D),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: const Icon(
                                  Icons.add_a_photo_rounded,
                                  color: Colors.black,
                                  size: 19,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              hintText: "Enter your name",
                              fillColor: Color(0xffF4F7FF),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 17),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16),
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
                              contentPadding: EdgeInsets.symmetric(vertical: 17),
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 16),
                                child: DropdownButton2(
                                  hint: Text(selectedvalue,style: TextStyle(color: Colors.black),),
                                  buttonWidth: 150,
                                  dropdownDecoration:
                                      BoxDecoration(color: Colors.grey),
                                  items: items
                                      .map((item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
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
                              SizedBox(width: 10,),
                              Expanded(child:  Container(
                                margin: EdgeInsets.only(top: 16),
                                child: TextField(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Color(0xffF4F7FF),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      borderSide: BorderSide.none,
                                    ),
                                    contentPadding: EdgeInsets.symmetric(vertical: 17),
                                  ),
                                ),
                              ),)
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xffF4F7FF),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 17),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xffF4F7FF),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 17),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xffF4F7FF),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 17),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          child: CupertinoButton(
                            padding: EdgeInsets.only(left: 100,right: 100),
                              child: Text("Sign Up",style: TextStyle(fontWeight: FontWeight.bold),),
                              color: Color(0xffF5AD0D),
                              onPressed: (){ }
                          ),
                        ),
                      ],
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
