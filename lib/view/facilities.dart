import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/components/auth_screens_decor.dart';
import 'package:rentpayy/components/custom_appbar.dart';
import 'package:rentpayy/components/custom_checkbox.dart';
import 'package:rentpayy/utils/style/AppColors.dart';

class Facilities extends StatefulWidget {
  const Facilities({Key? key}) : super(key: key);

  @override
  State<Facilities> createState() => _FacilitiesState();
}

class _FacilitiesState extends State<Facilities> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: custom_appbar(),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: AppColors.primaryColor,
            child: Container(
              decoration: auth_screens_decor(),
              child: Padding(
                padding: EdgeInsets.only(left: 44.w, right: 44.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 47.h,
                    ),
                    Text(
                      "Select Facilities",
                      style: TextStyle(
                          fontSize: 26.sp, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 33.h,
                    ),
                    Row(
                      children: [
                        Custom_Checkbox(text: "Water"),
                        SizedBox(
                          width: 20.w,
                        ),
                        Custom_Checkbox(text: "Study Hall"),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        Custom_Checkbox(text: "Security"),
                        SizedBox(
                          width: 20.w,
                        ),
                        Custom_Checkbox(text: "Solar"),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        Custom_Checkbox(text: "Laundary"),
                        SizedBox(
                          width: 20.w,
                        ),
                        Custom_Checkbox(text: "Kitchen"),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        Custom_Checkbox(text: "Mess"),
                        SizedBox(
                          width: 20.w,
                        ),
                        Custom_Checkbox(text: "Canteen"),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        Custom_Checkbox(text: "Lawn"),
                        SizedBox(
                          width: 20.w,
                        ),
                        Custom_Checkbox(text: "Transport"),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        Custom_Checkbox(text: "Electricity"),
                        SizedBox(
                          width: 20.w,
                        ),
                        Custom_Checkbox(text: "Generator"),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        Custom_Checkbox(text: "Lounge"),
                        SizedBox(
                          width: 20.w,
                        ),
                        Custom_Checkbox(text: "Wifi"),
                      ],
                    ),
                    SizedBox(
                      height: 22.6.h,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Others",
                        style: TextStyle(
                            fontSize: 17.sp, fontWeight: FontWeight.w600),
                      ),
                      
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
