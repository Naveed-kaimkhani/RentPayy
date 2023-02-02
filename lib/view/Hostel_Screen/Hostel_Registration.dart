import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/components/auth_screens_decor.dart';
import 'package:rentpayy/components/circle_progress.dart';
import 'package:rentpayy/components/mini_Button.dart';
import 'package:rentpayy/components/point_increament_button.dart';
import 'package:rentpayy/components/upper_design.dart';
import 'package:rentpayy/model/hostelModel.dart';
import 'package:rentpayy/utils/style/AppColors.dart';
import 'package:rentpayy/utils/utils.dart';
import 'package:rentpayy/view/Hostel_Screen/facilities.dart';


class Hostel_Registration extends StatefulWidget {
  final hostelModel? hostel;
  const Hostel_Registration({Key? key, this.hostel}) : super(key: key);

  @override
  State<Hostel_Registration> createState() => _Hostel_RegistrationState();
}

class _Hostel_RegistrationState extends State<Hostel_Registration>
    with WidgetsBindingObserver {
  TextEditingController descriptionController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = utils.getFireStoreInstance();

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
    super.dispose();

    descriptionController.dispose();
 
  }

 

  void savedata() {
    isLoading(true);
    if (person_per_room == 0 &&
        total_capacity_increment == 0 &&
        available_capacity_increment == 0) {
      utils.flushBarErrorMessage("Please enter hostel details", context);
    } else {
    
      hostelModel Hostel = hostelModel(
        name: widget.hostel!.name,
        email: widget.hostel!.email,
        uid: widget.hostel!.uid,
        charges: widget.hostel!.charges,
        hostel_address: widget.hostel!.hostel_address,
        hostel_phone: widget.hostel!.hostel_phone,
        hostel_gender_type: typeselectedvalue,
        hostel_type: hostelselectedvalue,
        available_capacity: available_capacity_increment,
        person_per_room: person_per_room,
        description: descriptionController.text,
        total_capacity: total_capacity_increment,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Facilities(
                  hostel: Hostel,
                )),
      );
    }
    isLoading(false);
  }

  void isLoading(bool value) {
    setState(() {
      isLoadingNow = value;
    });
  }

  @override
  void initState() {
    utils.checkConnectivity(context);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          appBar: upper_design(
            needcolor: true,
            needicon: true,
            isUserDelete: true,
          ),
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
                      
                              hostelType(),
                              SizedBox(
                                width: 15.w,
                              ),
                         
                              genderType(),
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
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 98.w,
                              ),
                              Text(
                                "Availabile Capacity",
                                style: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 13.h,
                          ),
                          Row(
                            children: [
                              StatefulBuilder(
                                builder: (context, myStatefunc) {
                                  return Point_increament_button(
                                    minus: () {
                                      if (total_capacity_increment > 0) {
                                        myStatefunc(
                                            () => total_capacity_increment--);
                                      }
                                    },
                                    plus: () {
                                      myStatefunc(
                                          () => total_capacity_increment++);
                                    },
                                    increment: total_capacity_increment,
                                  );
                                },
                              ),
                              SizedBox(
                                width: 21.w,
                              ),
                              StatefulBuilder(
                                builder: (context, myStatefunc) {
                                  return Point_increament_button(
                                    minus: () {
                                      if (available_capacity_increment > 0) {
                                        myStatefunc(() =>
                                            available_capacity_increment--);
                                      }
                                    },
                                    plus: () {
                                      myStatefunc(
                                          () => available_capacity_increment++);
                                    },
                                    increment: available_capacity_increment,
                                  );
                                },
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
                                StatefulBuilder(
                                  builder: (context, myStatefunc) {
                                    return Point_increament_button(
                                      minus: () {
                                        if (person_per_room > 0) {
                                          myStatefunc(() => person_per_room--);
                                        }
                                      },
                                      plus: () {
                                        myStatefunc(() => person_per_room++);
                                      },
                                      increment: person_per_room,
                                    );
                                  },
                                ),
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
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      maxLength: 250,
                                      maxLines: 8,
                                      controller: descriptionController,
                                      decoration: InputDecoration.collapsed(
                                          hintText: "Write a description"),
                                    ),
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
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();

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
      ),
    );
  }

  Container hostelType() {
    return Container(
      height: 60.h,
      decoration: BoxDecoration(
        color: Color(0xffF4F7FF),
        borderRadius: BorderRadius.circular(7.r),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          focusColor: AppColors.primaryColor,
          dropdownElevation: 0,
          buttonElevation: 0,
          icon: Padding(
            padding: EdgeInsets.only(right: 17.w),
            child: Icon(
              Icons.arrow_drop_down,
              color: AppColors.primaryColor,
            ),
          ),
          dropdownDecoration: BoxDecoration(
            color: AppColors.textfieldsColor,
            borderRadius: BorderRadius.circular(7.r),
          ),
          hint: Text(hostelselectedvalue!),
          items: HostelList.map(
            (value) => DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            ),
          ).toList(),
          onChanged: (value) {
            setState(() {
              hostelselectedvalue = value as String;
            });
        
          },
        ),
      ),
    );
  }

  Container genderType() {
    return Container(
      height: 60.h,
      decoration: BoxDecoration(
        color: Color(0xffF4F7FF),
        borderRadius: BorderRadius.circular(7.r),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          focusColor: AppColors.primaryColor,
          dropdownElevation: 0,
          buttonElevation: 0,
          icon: Padding(
            padding: EdgeInsets.only(right: 17.w),
            child: Icon(
              Icons.arrow_drop_down,
              color: AppColors.primaryColor,
            ),
          ),
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
    );
  }
}
