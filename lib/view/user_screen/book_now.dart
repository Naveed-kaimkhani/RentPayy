import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/components/authButton.dart';
import 'package:rentpayy/components/payment_button.dart';

import '../../utils/style/AppColors.dart';

class book_now extends StatefulWidget {
  book_now({Key? key}) : super(key: key);

  @override
  State<book_now> createState() => _book_nowState();
}

class _book_nowState extends State<book_now> {
  List<Widget> payment = [];

  List<String> genderList = ["1 month", "3 months","6 months","1 year"];
  int increment = 0;
  int value = 0;
  String? selectedvalue = " Per month";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: (() => Navigator.pop(context)),
          icon: Image.asset("asset/back2.png"),
        ),
        centerTitle: true,
        title: Text(
          "Book Now",
          style: TextStyle(
              fontSize: 21.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 18, right: 18),
        child: Column(
          children: [
            SizedBox(
              height: 38.h,
            ),
            Container(
              height: 240.h,
              width: 392.w,
              decoration: BoxDecoration(
                color: AppColors.textfieldsColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 7, right: 10, top: 7, bottom: 7),
                    child: Image.asset("asset/room.png"),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 19.h,
                        ),
                        Text(
                          "Bakhtawar Hostel",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20.sp),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Image.asset("asset/stars.png"),
                        SizedBox(
                          height: 8.h,
                        ),
                        Row(
                          children: [
                            Image.asset("asset/location.png"),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              "Jamshoro,Pakistan",
                              style: TextStyle(
                                  fontSize: 10.sp, fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 92.w,
                              height: 26.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(23.r),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 3.81, right: 3.81),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      child: Container(
                                        width: 10.8.w,
                                        height: 10.8.h,
                                        decoration: BoxDecoration(
                                          color: AppColors.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                        child: Image.asset("asset/minus2.png"),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          if (increment == 0) {
                                            increment = 0;
                                          } else {
                                            increment--;
                                          }
                                        });
                                      },
                                    ),
                                    Text(
                                      increment.toString(),
                                      style: TextStyle(fontSize: 15.sp),
                                    ),
                                    InkWell(
                                      child: Container(
                                        width: 10.8.w,
                                        height: 10.8.h,
                                        decoration: BoxDecoration(
                                          color: AppColors.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                        child: Image.asset("asset/plus2.png"),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          increment++;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            StatefulBuilder(builder: (context, setState) {
                              return Container(
                                width: 92.w,
                                height: 26.h,
                                color: Colors.white,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2(
                                    buttonElevation: 0,
                                    dropdownElevation: 0,
                                    itemHeight: 40.h,
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: AppColors.primaryColor,
                                    ),
                                    hint: Text(
                                      selectedvalue!,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10),
                                    ),
                                    buttonWidth: 100,
                                    dropdownDecoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(7.r),
                                        color: AppColors.textfieldsColor),
                                    items: genderList
                                        .map(
                                          (value) => DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value,style: TextStyle(
                                                color: Colors.black, fontSize: 10),),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        selectedvalue = value as String;
                                      });
                                    },
                                  ),
                                ),
                              );
                            }),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Subtotal",
                              style: TextStyle(
                                fontSize: 7.sp,
                              ),
                            ),
                            SizedBox(
                              width: 110.w,
                            ),
                            RichText(
                                text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "200",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.primaryColor)),
                                TextSpan(
                                    text: " Rs",
                                    style: TextStyle(
                                        fontSize: 7, color: Colors.black)),
                              ],
                            ))
                          ],
                        ),
                        SizedBox(height: 12.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Subtotal x $increment",
                              style: TextStyle(
                                fontSize: 7.sp,
                              ),
                            ),
                            SizedBox(
                              width: 100.w,
                            ),
                            RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "400",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.primaryColor)),
                                    TextSpan(
                                        text: " Rs",
                                        style: TextStyle(
                                            fontSize: 7, color: Colors.black)),
                                  ],
                                ),),
                          ],
                        ),
                        SizedBox(height: 12.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w300
                              ),
                            ),
                            SizedBox(
                              width: 100.w,
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: "400",
                                      style: TextStyle(
                                          fontSize: 27.sp,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.primaryColor)),
                                  TextSpan(
                                      text: " Rs",
                                      style: TextStyle(
                                          fontSize: 7, color: Colors.black)),
                                ],
                              ),),
                          ],
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 43.h,
            ),
            Text(
              "Choose Payment Method",
              style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 19.h,
            ),
            custom_payment("Jazz Cash", "asset/jazzcash.png", 0, 0),  SizedBox(
              height: 11.h,
            ),
            custom_payment("Easy Paisa", "asset/easypaisa.png", 1, 0),  SizedBox(
              height: 11.h,
            ),
            custom_payment("Bank Transfer", "asset/hbl.png", 2, 0),
            SizedBox(height: 170.h,),
            authButton(text: "Continue to Payment", func: ()
                {}, color: AppColors.primaryColor)
          ],
        ),
      ),
    );
  }
}
