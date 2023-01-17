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
import 'package:rentpayy/view/Hostel_Screen/add_gallery.dart';
import '../../resources/FirebaseMethods.dart';
import '../../utils/routes/RoutesName.dart';
import '../starter_screen.dart';

class Facilities extends StatefulWidget {
  Facilities({Key? key}) : super(key: key);
  @override
  State<Facilities> createState() => _FacilitiesState();
}

class _FacilitiesState extends State<Facilities>  {
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

  final user = FirebaseAuth.instance.currentUser!.uid;

  void savedata() {
    if (checkboxList.isEmpty) {
      print(checkboxList);
      utils.flushBarErrorMessage("Please select facilites", context);
    } else {
      db.collection("hostels").doc(user).update({
        'facilities': checkboxList,
      }).then((value) {
        print(checkboxList);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => add_gallery()),
        );
      });
    }
  }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) async {
  //   super.didChangeAppLifecycleState(state);
  //   if (state == AppLifecycleState.resumed) {
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => StarterScreen()));
  //     // print("resumed");
  //     Navigator.pushNamed(context, RoutesName.starterScreen);
  //   } else if (state == AppLifecycleState.inactive) {
  //     await FirebaseMethods.delete_User(context);
  //   } else if (state == AppLifecycleState.detached) {
  //     // print("detached"); //
  //   } else if (state == AppLifecycleState.paused) {
  //     // print("paused");
  //   }
  // }
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addObserver(this);
  }
  @override
  void dispose() {
        // WidgetsBinding.instance.removeObserver(this);
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
          
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: MiniButton(
                          text: "Next",
                          func: () {
                            FocusManager.instance.primaryFocus?.unfocus();

                            savedata();
                          },
                          color: AppColors.primaryColor,
                          icon: Icons.arrow_forward,
                        ),
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
