import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/utils/style/AppColors.dart';
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
    favourites(),
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
              icon: Icons.home,
              text: "Home",
            ),
            GButton(
              icon: Icons.chat,
              text: "Chat",
            ),
            GButton(
              icon: Icons.favorite,
              text: "Likes",
            ),
            GButton(
              icon: Icons.settings,
              text: "Setting",
            ),
          ],
        ),
      ),
      // BottomNavigationBar(
      //   backgroundColor: AppColors.primaryColor,
      //   onTap: onTap,
      //   currentIndex: currentindex,
      //   selectedItemColor: Colors.black,
      //   unselectedItemColor: Colors.grey.shade300,
      //   showSelectedLabels: false,
      //   showUnselectedLabels: false,
      //   elevation: 0,
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.apps), label: "Home"),
      //     BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Bar"),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.search_rounded), label: "Search"),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
      //   ],
      // ),
      body: pages[currentindex],
    );
  }
}
