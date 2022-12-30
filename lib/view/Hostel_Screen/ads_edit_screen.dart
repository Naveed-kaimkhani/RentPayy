import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rentpayy/components/profilePic.dart';
import 'package:rentpayy/utils/style/AppColors.dart';
import 'package:rentpayy/utils/style/text_manager.dart';
import 'package:rentpayy/utils/style/text_style.dart';
import 'package:rentpayy/view/Hostel_Screen/facilities.dart';
import 'package:rentpayy/view/Hostel_Screen/seller_dashboard.dart';

import '../../components/dropdown_button.dart';
import '../../components/quantity_box.dart';
import '../../model/hostelModel.dart';
import '../../utils/style/Images.dart';
import '../../view_model/HostelDetailsProvider.dart';
import '../user_screen/facility_container.dart';

class ads_edit_screen extends StatefulWidget {
  const ads_edit_screen({super.key});

  @override
  State<ads_edit_screen> createState() => _ads_edit_screenState();
}

class _ads_edit_screenState extends State<ads_edit_screen> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    hostelModel? hostel =
        Provider.of<HostelDetailsProvider>(context, listen: false)
            .hostelDetails;
    final Sizes = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 50,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
              child: CircleAvatar(
                  radius: 10,
                  backgroundColor: AppColors.primaryColor,
                  child: Image.asset(Images.whitebackButton)),
              onTap: () => Navigator.pop(context)),
        ),
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            "Edit Ad",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              profilePic(
                  url: hostel!.pictures![0], height: 111.h, width: 111.w),
              //  Location Circle
              // CircleAvatar(
              //   radius: 50,
              //   backgroundColor: AppColors.bgColor,
              //   child: Icon(
              //     Icons.location_on_outlined,
              //     color: AppColors.locationColor,
              //     size: 55,
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              // Text With Underline
              Text(
                hostel.name!,
                style: CustomTextStyle.headingsAll,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 240,
                    child: Divider(
                      color: Colors.black,
                      indent: 2.0,
                      thickness: 1,
                    ),
                  ),
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: AppColors.primaryColor,
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 13,
                    ),
                  )
                ],
              ),

              SizedBox(
                height: 30,
              ),
              // Drop Down menu
              Row(
                children: [
                  Dropdown_button(
                    list: [
                      'Bachelor Hostel',
                      'Hospital Hostel',
                      'Etc Hostel',
                    ],
                    hinttext: "Bachelor Hostel",
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Dropdown_button(
                    list: [
                      'Male',
                      'Female',
                    ],
                    hinttext: "Male",
                  ),
                ],
              ),

              // Table Selected Dropdown Value
              SizedBox(
                height: 10,
              ),

              Row(
                children: [
                  // first Column
                  Stack(
                    children: [
                      Container(
                        width: Sizes.width * 0.48,
                        height: 45.h,
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.r),
                              topRight: Radius.circular(10.r),
                            )),
                        child: Center(
                          child: Text(
                            'Bachelor Hostel',
                            style: CustomTextStyle.font_17,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  // Second Column
                  Stack(
                    children: [
                      Container(
                        width: Sizes.width * 0.33,
                        height: 45.h,
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.r),
                              topRight: Radius.circular(10.r),
                            )),
                        child: Center(
                          child: Text(
                            'Female',
                            style: CustomTextStyle.font_17,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // White Background
              Row(
                children: [
                  // first Column
                  Stack(
                    children: [
                      Container(
                        width: Sizes.width * 0.48,
                        height: 45.h,
                        decoration: BoxDecoration(
                            color: AppColors.greyBackgroundCOlor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.r),
                              bottomRight: Radius.circular(10.r),
                            )),
                        child: Center(
                          child: Text(
                            'Bachelor Hostel',
                            style: CustomTextStyle.font_black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  // Second Column
                  Stack(
                    children: [
                      Container(
                        width: Sizes.width * 0.33,
                        height: 45.h,
                        decoration: BoxDecoration(
                            color: AppColors.greyBackgroundCOlor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.r),
                              bottomRight: Radius.circular(10.r),
                            )),
                        child: Center(
                          child: Text(
                            'Female',
                            style: CustomTextStyle.font_black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Total Capacity Row
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        'Total Capacity',
                        style: CustomTextStyle.font_black_w500,
                      ),
                      // Quantity Box
                      QuanityBox(
                        Quantity: hostel.total_capacity!,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 55.w,
                  ),
                  Column(
                    children: [
                      Text(
                        'Available Capacity',
                        style: CustomTextStyle.font_black_w500,
                      ),
                      // Quantity Box
                      QuanityBox(
                        Quantity: hostel.available_capacity!,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Persons per Room',
                        style: CustomTextStyle.font_black_w500,
                      ),
                      // Quantity Box
                      QuanityBox(
                        Quantity: hostel.person_per_room!,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 55.w,
                  ),
                ],
              ),
              // facilities
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Facilities',
                    style: CustomTextStyle.font_black_w500,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Facilities()));
                      },
                      child: Text(
                        "edit",
                        textAlign: TextAlign.right,
                        style: TextStyle(color: AppColors.primaryColor),
                      ))
                ],
              ),
              // Grid View
              GridView.count(
                padding: EdgeInsets.zero,

                shrinkWrap: true,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,

                physics: new NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                childAspectRatio: 1,
                children: hostel.facilities!
                    .map<Widget>(
                      (e) => facility_container(text: e),
                    )
                    .toList(),
                //  childAspectRatio: 1.1,
              ),

              // SizedBox(
              //   height: 800,
              //   child: GridView(
              //     shrinkWrap: true,
              //     physics: NeverScrollableScrollPhysics(),
              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 1,
              //         mainAxisSpacing: 0,
              //         crossAxisSpacing: 0),
              //     children: [
              //       SizedBox(
              //         height: 10,
              //         width: Sizes.width * 0.5,
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             ad_page_container(
              //               text: 'Electricity',
              //               // image: Images.facilities,
              //             ),
              //             ad_page_container(
              //               text: 'Electricity',
              //               // image: Images.facilities,
              //             ),
              //             ad_page_container(
              //               text: 'Electricity',
              //               // image: Images.facilities,
              //             ),
              //           ],
              //         ),
              //       ),
              //       SizedBox(
              //         height: 10,
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             ad_page_container(
              //               text: 'Electricity',
              //               // image: Images.facilities,
              //             ),
              //             ad_page_container(
              //               text: 'Electricity',
              //               // image: Images.facilities,
              //             ),
              //             ad_page_container(
              //               text: 'Electricity',
              //               // image: Images.facilities,
              //             ),
              //           ],
              //         ),
              //       ),
              //       SizedBox(
              //         height: 10,
              //         child: Row(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             ad_page_container(
              //               text: 'Electricity',
              //               // image: Images.facilities,
              //             ),
              //             ad_page_container(
              //               text: 'Electricity',
              //               // image: Images.facilities,
              //             ),
              //             ad_page_container(
              //               text: 'Electricity',
              //               // image: Images.facilities,
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              // Facilities(),
              // Description
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Description',
                  style: CustomTextStyle.font_black_w500,
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                  decoration: BoxDecoration(
                      color: AppColors.greyBackgroundCOlor,
                      borderRadius: BorderRadius.circular(12)),
                  child: TextField(
                      maxLength: 250,
                      // maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: hostel.description),
                      keyboardType: TextInputType.multiline,
                      maxLines: 4)),
// Save Changes Button
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 321.w,
                height: 67.h,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: AppColors.primaryColor,
                    ),
                    onPressed: () {},
                    child: Text("Save Changes")),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
