import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:rentpayy/view/Hostel_Screen/ad_boost_screen.dart';
import 'package:rentpayy/view/Hostel_Screen/hostel_setting_screen.dart';

import '../../utils/style/AppColors.dart';
import 'ads_details_screen.dart';
import 'ads_edit_screen.dart';

class SellerDashboard extends StatefulWidget {
  const SellerDashboard({super.key});

  @override
  State<SellerDashboard> createState() => _SellerDashboardState();
}

class _SellerDashboardState extends State<SellerDashboard> {
  List pages = [
    ads_details_screen(),
    ads_edit_screen(),
    ad_boost_screen(),
    hostel_setting_screen(),
  ];
  int currentindex = 0;
  void onTap(int index) {
    setState(() {
      currentindex = index;
    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: 0,
          elevation: 0,
   
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 20.h),
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10))),
          child: GNav(
            backgroundColor: AppColors.primaryColor,
            color: Colors.white,
            activeColor: AppColors.primaryColor,
            tabBackgroundColor: Colors.white,
            padding: EdgeInsets.all(6),
            gap: 8,
            onTabChange: onTap,
            tabs: [
              GButton(
                icon: Icons.grid_view_rounded,
                text: "Ads",
              ),
              GButton(
                icon: Icons.edit,
                text: "Edit Ad",
              ),
              GButton(
                icon: Icons.rocket_launch_outlined,
                text: "Plans",
              ),
              GButton(
                icon: Icons.settings_outlined,
                text: "Setting",
              ),
            ],
          ),
        ),
        body: pages[currentindex],
      ),
    );
  }
}
