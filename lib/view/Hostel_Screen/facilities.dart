import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/components/auth_screens_decor.dart';
import 'package:rentpayy/components/custom_appbar.dart';
import 'package:rentpayy/components/custom_checkbox.dart';
import 'package:rentpayy/components/mini_Button.dart';
import 'package:rentpayy/utils/style/AppColors.dart';
import 'package:rentpayy/utils/utils.dart';
import 'package:rentpayy/view/Hostel_Screen/Hostel_Registration.dart';

import '../../utils/routes/RoutesName.dart';
import '../../utils/style/Images.dart';

class Facilities extends StatefulWidget {
  Facilities({Key? key}) : super(key: key);
  @override
  State<Facilities> createState() => _FacilitiesState();
}

class _FacilitiesState extends State<Facilities> {
  TextEditingController controller = TextEditingController();
  List<String> checkboxList = [];
  bool isLoadingNow = false;
  String? filled;

  bool waterIsSelected = false,
      studyHallIsSelected = false,
      SecurityIsSelected = false,
      SolarIsSelected = false,
      LaundaryIsSelected = false,
      KitchenIsSelected = false,
      MessIsSelected = false,
      CanteenIsSelected = false,
      LawnIsSelected = false,
      TransportIsSelected = false,
      ElectricityIsSelected = false,
      GeneratorIsSelected = false,
      LoungeIsSelected = false,
      WifiIsSelected = false;
  FirebaseFirestore db = FirebaseFirestore.instance;

  final user = FirebaseAuth.instance.currentUser!.uid;

  @override
  void initState() {
    print("object");

    super.initState();
  }

  // void savelist() {
  //   setState(() {
  //     for(int i =0;i < widget.checkboxList.length; i++)
  //       print(widget.checkboxList[i]);
  //   });

  // }
//   List<String> toList() {

//   chipstuete.forEach((item) {
//     newtuete.add(item.toString());
//   });

//   return newtuete.toList();
// }

  void savedata() {
    if (checkboxList.isEmpty) {
      utils.flushBarErrorMessage("Please select facilites", context);
    } else {
      db.collection("hostels").doc(user).update({
        'facilities': checkboxList,
      }).then((value) {
        print("data updated for facilities");
        Navigator.popAndPushNamed(context, RoutesName.uploadPictures);
      });
    }
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
                padding: EdgeInsets.only(left: 44.w, right: 44.w),
                child: SingleChildScrollView(
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
                          Custom_Checkbox(
                            text: "Water",
                            func: () {
                              setState(() {
                                waterIsSelected = !waterIsSelected;
                                if (waterIsSelected)
                                  checkboxList.add("water,");
                                else
                                  checkboxList.remove("water,");
                              });
                            },
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Custom_Checkbox(
                            text: "Study Hall",
                            func: () {
                              setState(() {
                                studyHallIsSelected = !studyHallIsSelected;
                                if (!studyHallIsSelected)
                                  checkboxList.add("Study Hall,");
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Custom_Checkbox(
                            text: "Security",
                            func: () {
                              setState(() {
                                SecurityIsSelected = !SecurityIsSelected;
                                if (SecurityIsSelected)
                                  checkboxList.add("Security,");
                              });
                            },
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Custom_Checkbox(
                            text: "Solar",
                            func: () {
                              setState(() {
                                SolarIsSelected = !SolarIsSelected;
                                if (SolarIsSelected) checkboxList.add("Solar,");
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Custom_Checkbox(
                            text: "Laundary",
                            func: () {
                              setState(() {
                                LaundaryIsSelected = !LaundaryIsSelected;
                                if (LaundaryIsSelected)
                                  checkboxList.add("Laundary,");
                              });
                            },
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Custom_Checkbox(
                            text: "Kitchen",
                            func: () {
                              setState(() {
                                KitchenIsSelected = !KitchenIsSelected;
                                if (KitchenIsSelected)
                                  checkboxList.add("Kitchen,");
                                else if (!KitchenIsSelected)
                                  checkboxList.remove("Kitchen,");
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Custom_Checkbox(
                            text: "Mess",
                            func: () {
                              setState(() {
                                MessIsSelected = !MessIsSelected;
                                if (MessIsSelected) checkboxList.add("Mess,");
                              });
                            },
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Custom_Checkbox(
                            text: "Canteen",
                            func: () {
                              setState(() {
                                CanteenIsSelected = !CanteenIsSelected;
                                if (CanteenIsSelected)
                                  checkboxList.add("Canteen,");
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Custom_Checkbox(
                            text: "Lawn",
                            func: () {
                              setState(() {
                                LawnIsSelected = !LawnIsSelected;
                                if (LawnIsSelected) checkboxList.add("Lawn,");
                              });
                            },
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Custom_Checkbox(
                            text: "Transport",
                            func: () {
                              setState(() {
                                TransportIsSelected = !TransportIsSelected;
                                if (TransportIsSelected)
                                  checkboxList.add("Transport,");
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Custom_Checkbox(
                            text: "Electricity",
                            func: () {
                              setState(() {
                                ElectricityIsSelected = !ElectricityIsSelected;
                                if (ElectricityIsSelected)
                                  checkboxList.add("Electricity,");
                              });
                            },
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Custom_Checkbox(
                            text: "Generator",
                            func: () {
                              setState(() {
                                GeneratorIsSelected = !GeneratorIsSelected;
                                if (GeneratorIsSelected)
                                  checkboxList.add("Generator,");
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
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
                      // Container(
                      //   height: 20.h,
                      //   width: 20.w,
                      //   child: Row(
                      //     children: [
                      //       Wrap(
                      //         children: list,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Container(
                      //   height: 50.h,
                      //   width: 400.w,
                      //   child: TextField(
                      //     controller: controller,
                      //     onSubmitted: (value) {
                      //       setState(() {
                      //         filled = value;
                      //         print(filled);
                      //         list.add(Text(filled!));
                      //       });
                      //     },
                      //   ),
                      // ),
                      // Container(
                      //   height: 20.h,
                      //   width: 20.w,
                      //   child: Row(
                      //     children: [
                      //       Container(
                      //         width: 20.w,
                      //         height: 20.h,
                      //         child: ListView(
                      //           scrollDirection: Axis.horizontal,
                      //           children: list,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),

                      MiniButton(
                        text: "next",
                        func: () {
                          // setState(() {
                          //   Navigator.push(context,MaterialPageRoute(builder: (context)=> Hostel_Registration() ));
                          // });
                          savedata();
                        },
                        color: AppColors.primaryColor,
                        icon: Icons.arrow_forward,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
