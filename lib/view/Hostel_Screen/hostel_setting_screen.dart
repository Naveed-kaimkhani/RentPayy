import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rentpayy/utils/style/AppColors.dart';
import 'package:rentpayy/view/Hostel_Screen/update_password.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/profilePic.dart';
import '../../model/hostelModel.dart';
import '../../utils/routes/RoutesName.dart';
import '../../view_model/HostelDetailsProvider.dart';
import '../starter_screen.dart';
import 'ads_edit_screen.dart';

class hostel_setting_screen extends StatelessWidget {
  const hostel_setting_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    hostelModel? hostel =
        Provider.of<HostelDetailsProvider>(context, listen: false)
            .hostelDetails;
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          Navigator.pushNamed(context, RoutesName.SellerDashboard);
          return true;
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 27.w, top: 50.h, right: 27.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      profilePic(
                        url: hostel!.pictures![0],
                        height: 61.h,
                        width: 61.w,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 13.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              hostel.name!,
                              style: TextStyle(
                                  fontSize: 22.sp, fontWeight: FontWeight.w600),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  size: 14.h,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text(
                                  hostel.hostel_address!,
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  ExpansionTile(
                    title: Text("Account"),
                    leading: settingScreen_icon(
                      icon: Icons.person,
                    ),
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 45.w),
                        child: ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ads_edit_screen()));
                            },
                            leading: settingScreen_Miniicon(icon: Icons.edit),
                            title: Row(
                              children: [
                                Text("Edit"),
                                SizedBox(
                                  width: 163.w,
                                ),
                                Icon(Icons.arrow_forward_ios_rounded,
                                    size: 20.sp),
                              ],
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 45.w),
                        child: ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const update_password()),
                              );
                            },
                            leading: settingScreen_Miniicon(icon: Icons.lock),
                            title: Row(
                              children: [
                                Text("Password Options"),
                                SizedBox(
                                  width: 45.w,
                                ),
                                Icon(Icons.arrow_forward_ios_rounded,
                                    size: 20.sp),
                              ],
                            )),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    trailing:
                        Icon(Icons.arrow_forward_ios_rounded, size: 20.sp),
                    initiallyExpanded: true,
                    title: Text("Payment Methods"),
                    leading: settingScreen_icon(icon: Icons.payments_outlined),
                  ),
                  ExpansionTile(
                    title: Text("Help and Support"),
                    leading: settingScreen_icon(icon: Icons.help),
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 45.w),
                        child: ListTile(
                            onTap: () {},
                            // leading: Image.asset("asset/faq.png"),
                            leading: settingScreen_icon(
                                icon: Icons.question_answer_outlined),
                            title: Row(
                              children: [
                                Text("FAQs"),
                                SizedBox(
                                  width: 155.w,
                                ),
                                Icon(Icons.arrow_forward_ios_rounded,
                                    size: 20.sp),
                              ],
                            )),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    trailing:
                        Icon(Icons.arrow_forward_ios_rounded, size: 20.sp),
                    collapsedTextColor: Colors.black,
                    title: Text("Booking History"),
                    // leading: Image.asset("asset/history.png"),
                    leading: settingScreen_icon(icon: Icons.schedule_rounded),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 32.w),
                    child: Row(
                      children: [
                        // Image.asset("asset/logout.png"),
                        Icon(
                          Icons.logout,
                          color: AppColors.primaryColor,
                          size: 22.h,
                        ),
                        SizedBox(
                          width: 21.w,
                        ),
                        GestureDetector(
                          onTap: () async {
                            await FirebaseAuth.instance.signOut();

                            SharedPreferences preferences =
                                await SharedPreferences.getInstance();
                            await preferences.setInt('initScreen', 0);
                            await preferences.setInt('isUser', 0);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StarterScreen()));
                          },
                          child: Text(
                            "Logout",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 21.sp,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class settingScreen_icon extends StatelessWidget {
  IconData? icon;
  settingScreen_icon({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 39.h,
      width: 39.w,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Center(
        child: Icon(
          icon,
          color: Colors.white,
          size: 16.h,
        ),
      ),
    );
  }
}

class settingScreen_Miniicon extends StatelessWidget {
  IconData? icon;
  settingScreen_Miniicon({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 29.h,
      width: 29.w,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Center(
        child: Icon(
          icon,
          color: Colors.white,
          size: 11.h,
        ),
      ),
    );
  }
}
