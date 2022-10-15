import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/components/auth_screens_decor.dart';
import 'package:rentpayy/components/custom_appbar.dart';
import 'package:rentpayy/components/mini_Button.dart';
import 'package:rentpayy/components/point_increament_button.dart';
import 'package:rentpayy/utils/style/AppColors.dart';

class Hostel_Registration extends StatefulWidget {
  const Hostel_Registration({Key? key}) : super(key: key);

  @override
  State<Hostel_Registration> createState() => _Hostel_RegistrationState();
}

class _Hostel_RegistrationState extends State<Hostel_Registration> {

  TextEditingController totalCapacityController = TextEditingController();
  TextEditingController availableCapacityController = TextEditingController();
  TextEditingController personPerRoomController = TextEditingController();


  List<String> genderList = ["Male", "Female"];
  List<String> HostelList = ["Bachelor Hostel","Working Hostel"];
  String? hostelselectedvalue = "Hostel Type";
  String? typeselectedvalue = "Type";

  @override
  void dispose() {
    totalCapacityController.dispose();
    availableCapacityController.dispose();
    personPerRoomController.dispose();
    super.dispose();
  }
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
                padding: EdgeInsets.only(left: 21.w, right: 22.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 57.h,
                    ),
                    Text(
                      "Hostel Registration",
                      style:
                          TextStyle(fontSize: 26.sp, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 42.h,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 60.h,
                          width: 185.w,
                          decoration: BoxDecoration(
                            color: AppColors.textfieldsColor,
                            borderRadius: BorderRadius.circular(12.h),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              dropdownElevation: 0,
                              buttonElevation: 0,
                              dropdownDecoration: BoxDecoration(
                                color: AppColors.textfieldsColor,
                                borderRadius: BorderRadius.circular(7.r),
                              ),
                              hint: Text(hostelselectedvalue!),
                              items: HostelList
                                  .map(
                                    (value) => DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  hostelselectedvalue = value as String;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Container(
                          height: 60.h,
                          width: 185.w,
                          decoration: BoxDecoration(
                            color: Color(0xffF4F7FF),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2( dropdownElevation: 0,
                              buttonElevation: 0,
                              dropdownDecoration: BoxDecoration(
                                color: AppColors.textfieldsColor,
                                borderRadius: BorderRadius.circular(7.r),
                              ),
                              hint: Text(typeselectedvalue!),
                              items: genderList
                                  .map(
                                    (value) => DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  typeselectedvalue = value as String;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 37.h,
                    ),
                    Row(
                      children: [
                        Text(
                          "Total Capacity",
                          style: TextStyle(
                              fontSize: 17.sp, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 98.w,
                        ),
                        Text(
                          "Availabile Capacity",
                          style: TextStyle(
                              fontSize: 17.sp, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    Row(
                      children: [
                        Point_increament_button(pointscotroller: totalCapacityController,),
                        SizedBox(
                          width: 21.w,
                        ),
                        Point_increament_button(pointscotroller: availableCapacityController,),
                      ],
                    ),
                    SizedBox(
                      height: 37.04.h,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Person per Room",style: TextStyle(
                          fontSize: 17.sp, fontWeight: FontWeight.w500),),
                          SizedBox(height: 13.04.h,),
                          Point_increament_button(pointscotroller: personPerRoomController,)
                        ],
                      ),
                    ),
                    SizedBox(height: 37.04.h,),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: 
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Description",style: TextStyle(
                          fontSize: 17.sp, fontWeight: FontWeight.w500),),
                          SizedBox(height: 13,),
                          Container(
                            width: 385.w,
                            height: 149,
                            decoration: BoxDecoration(
                              color: AppColors.textfieldsColor,
                              borderRadius: BorderRadius.circular(7.r),
                            ),
                            child: TextField(
                              maxLength: 250,
                              maxLines: 8,
                              decoration: InputDecoration.collapsed(hintText: "Write a description"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 13.85.h,),
                    Container(
                      alignment: Alignment.centerRight,
                        child: MiniButton(text: "Next", func: (){ }, color: AppColors.primaryColor,icon: Icons.arrow_forward_rounded),)
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
