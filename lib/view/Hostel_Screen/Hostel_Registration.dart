import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/components/auth_screens_decor.dart';
import 'package:rentpayy/components/circle_progress.dart';
import 'package:rentpayy/components/custom_appbar.dart';
import 'package:rentpayy/components/mini_Button.dart';
import 'package:rentpayy/components/point_increament_button.dart';
import 'package:rentpayy/components/upper_design.dart';
import 'package:rentpayy/model/hostelModel.dart';
import 'package:rentpayy/utils/routes/RoutesName.dart';
import 'package:rentpayy/utils/style/AppColors.dart';
import 'package:rentpayy/utils/utils.dart';
import 'package:rentpayy/view/Hostel_Screen/facilities.dart';

import '../../components/dropdown_button.dart';

class Hostel_Registration extends StatefulWidget {
  final hostelModel? hostel;
  const Hostel_Registration({Key? key, this.hostel}) : super(key: key);

  @override
  State<Hostel_Registration> createState() => _Hostel_RegistrationState();
}

class _Hostel_RegistrationState extends State<Hostel_Registration> {
  TextEditingController descriptionController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  hostelModel HostelModel = hostelModel();
  FirebaseFirestore db = FirebaseFirestore.instance;

  final user = FirebaseAuth.instance.currentUser!.uid;

  List<String> genderList = ["Male", "Female"];
  List<String> HostelList = ["Bachelor Hostel", "Working Hostel"];
  String? hostelselectedvalue = "Hostel Type";
  String? typeselectedvalue = "Type";
  bool isLoadingNow = false;
  int total_capacity_increment = 0;
  int available_capacity_increment = 0;
  int person_per_room = 0;
  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  Facilities fac = Facilities();

  void savedata() {
    isLoading(true);
    if (person_per_room == 0 &&
        total_capacity_increment == 0 &&
        available_capacity_increment == 0) {
      utils.flushBarErrorMessage("Please enter hostel details", context);
    } else {
      print("in else");
      db.collection("hostels").doc(user).update({
        "hostel_gender_type": typeselectedvalue,
        "hostel_type": hostelselectedvalue,
        "total_capacity": total_capacity_increment,
        "available_capacity": available_capacity_increment,
        "person_per_room": person_per_room,
        "description": descriptionController.text
      });
      print("data stored");
      Navigator.popAndPushNamed(context, RoutesName.facilities);
    }
    isLoading(false);
    print("data updated on hostel registration screen");
  }

  void isLoading(bool value) {
    setState(() {
      isLoadingNow = value;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: upper_design(),
        body: Stack(
          children: [
            Container(
              color: AppColors.primaryColor,
              child: Container(
                decoration: auth_screens_decor(),
                child: Padding(
                  padding: EdgeInsets.only(left: 21.w, right: 22.w),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 57.h,
                        ),
                        Text(
                          "Hostel Registration",
                          style: TextStyle(
                              fontSize: 26.sp, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 42.h,
                        ),
                        Row(
                          children: [
                            Dropdown_button(
                              list: HostelList,
                              hinttext: hostelselectedvalue,
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            Dropdown_button(
                              list: genderList,
                              hinttext: typeselectedvalue,
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
                            Point_increament_button(
                              minus: () {
                                setState(() {
                                  if (total_capacity_increment == 0)
                                    total_capacity_increment = 0;
                                  else
                                    total_capacity_increment--;
                                });
                              },
                              plus: () {
                                setState(() {
                                  total_capacity_increment++;
                                  print(total_capacity_increment);
                                });
                              },
                              increment: total_capacity_increment,
                            ),
                            SizedBox(
                              width: 21.w,
                            ),
                            Point_increament_button(
                              minus: () {
                                setState(() {
                                  if (available_capacity_increment == 0)
                                    available_capacity_increment = 0;
                                  else
                                    available_capacity_increment--;
                                });
                              },
                              plus: () {
                                setState(() {
                                  available_capacity_increment++;
                                  print("object");
                                });
                              },
                              increment: available_capacity_increment,
                            ),
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
                              Text(
                                "Person per Room",
                                style: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 13.04.h,
                              ),
                              Point_increament_button(
                                minus: () {
                                  setState(() {
                                    if (person_per_room == 0)
                                      person_per_room = 0;
                                    else
                                      person_per_room--;
                                  });
                                },
                                plus: () {
                                  setState(() {
                                    person_per_room++;
                                  });
                                },
                                increment: person_per_room,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 37.04.h,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Description",
                                style: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 13,
                              ),
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
                                  controller: descriptionController,
                                  decoration: InputDecoration.collapsed(
                                      hintText: "Write a description"),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 13.85.h,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: isLoadingNow
                              ? circle_progress()
                              : MiniButton(
                                  text: "Next",
                                  func: () {
                                    savedata();
                                  },
                                  color: AppColors.primaryColor,
                                  icon: Icons.arrow_forward),
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
