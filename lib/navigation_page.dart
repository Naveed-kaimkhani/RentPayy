import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/utils/style/AppColors.dart';
import 'package:rentpayy/view/user_screen/booking_history.dart';
import 'package:rentpayy/view/user_screen/favourites.dart';
import 'package:rentpayy/view/user_screen/user_front_screen.dart';
import 'package:rentpayy/view/user_screen/settings.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class navigation_page extends StatefulWidget {
  const navigation_page({Key? key}) : super(key: key);
  @override
  State<navigation_page> createState() => _navigation_pageState();
}

class _navigation_pageState extends State<navigation_page> {
  List pages = [
    user_front_Screen(),
    booking_history(),
    favourites(),
    setting_screen(),
  ];
  int currentindex = 0;
  void onTap(int index) {
    setState(() {
      currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: AppColors.primaryColor,
        padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 20.h),
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
              text: "Home",
            ),
            GButton(
              icon: Icons.hotel,
              text: "Bookings",
            ),
            GButton(
              icon: Icons.favorite_outline,
              text: "Likes",
            ),
            GButton(
              icon: Icons.settings_outlined,
              text: "Setting",
            ),
          ],
        ),
      ),
      body: pages[currentindex],
    );
  }
}
