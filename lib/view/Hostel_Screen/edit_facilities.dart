import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/components/auth_screens_decor.dart';
import 'package:rentpayy/components/custom_appbar.dart';
import 'package:rentpayy/components/custom_checkbox.dart';
import 'package:rentpayy/utils/style/AppColors.dart';
import 'package:rentpayy/utils/utils.dart';
import 'package:rentpayy/view/Hostel_Screen/ads_edit_screen.dart';

import '../../components/hostel_appBarButton.dart';
import '../../utils/style/Images.dart';

class edit_facilities extends StatefulWidget {
  edit_facilities({Key? key}) : super(key: key);
  @override
  State<edit_facilities> createState() => _edit_facilitiesState();
}

class _edit_facilitiesState extends State<edit_facilities> {
  List<String> checkboxList = [];
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

  void savedata() {
    if (checkboxList.isEmpty) {
      print(checkboxList);
      utils.flushBarErrorMessage("Please select facilites", context);
    } else {
      db.collection("hostels").doc(utils.getCurrentUserUid()).update({
        'facilities': checkboxList,
      }).then((value) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ads_edit_screen()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (() => Navigator.push(context,
              MaterialPageRoute(builder: (context) => ads_edit_screen()))),
          icon: hostel_appBarButton(
            Buttoncolor: AppColors.primaryColor,
            IconUrl: Images.whitebackButton,
          ),
          // SvgPicture.asset('asset/backIcon.png')
        ),
      ),
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
                        "Select edit_facilities",
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

                                if (waterIsSelected) {
                                  checkboxList.add("water");
                                  print(checkboxList);
                                } else
                                  checkboxList.remove("water");
                              });
                            },
                            isselected: waterIsSelected,
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Custom_Checkbox(
                            text: "Study Hall",
                            func: () {
                              setState(() {
                                studyHallIsSelected = !studyHallIsSelected;
                                if (studyHallIsSelected)
                                  checkboxList.add("Study Hall");
                                else
                                  checkboxList.remove("Study Hall");
                              });
                            },
                            isselected: studyHallIsSelected,
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
                                  checkboxList.add("Security");
                                else
                                  checkboxList.remove("Security");
                              });
                            },
                            isselected: SecurityIsSelected,
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Custom_Checkbox(
                            text: "Solar",
                            func: () {
                              setState(() {
                                SolarIsSelected = !SolarIsSelected;
                                if (SolarIsSelected)
                                  checkboxList.add("Solar");
                                else
                                  checkboxList.remove("Solar");
                              });
                            },
                            isselected: SolarIsSelected,
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
                                  checkboxList.add("Laundary");
                                else
                                  checkboxList.remove("Laundary");
                              });
                            },
                            isselected: LaundaryIsSelected,
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
                                  checkboxList.add("Kitchen");
                                else
                                  checkboxList.remove("Kitchen");
                              });
                            },
                            isselected: KitchenIsSelected,
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
                                if (MessIsSelected)
                                  checkboxList.add("Mess");
                                else
                                  checkboxList.remove("Mess");
                              });
                            },
                            isselected: MessIsSelected,
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Custom_Checkbox(
                            text: "Canteen",
                            func: () {
                              setState(() {
                                CanteenIsSelected = !CanteenIsSelected;
                                if (CanteenIsSelected) {
                                  checkboxList.add("Canteen");
                                } else
                                  checkboxList.remove("Canteen");
                              });
                            },
                            isselected: CanteenIsSelected,
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
                                if (LawnIsSelected)
                                  checkboxList.add("Lawn");
                                else
                                  checkboxList.remove("Lawn");
                              });
                            },
                            isselected: LawnIsSelected,
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
                                  checkboxList.add("Transport");
                                else
                                  checkboxList.remove("Transport");
                              });
                            },
                            isselected: TransportIsSelected,
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
                                if (ElectricityIsSelected) {
                                  checkboxList.add("Electricity");
                                } else {
                                  checkboxList.remove("Electricity");
                                }
                              });
                            },
                            isselected: ElectricityIsSelected,
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
                                  checkboxList.add("Generator");
                                else
                                  checkboxList.remove("Generator");
                              });
                            },
                            isselected: GeneratorIsSelected,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                      SizedBox(
                        width: 321.w,
                        height: 67.h,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: AppColors.primaryColor,
                            ),
                            onPressed: () async {
                              savedata();
                            },
                            child: Text("Save Changes")),
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
