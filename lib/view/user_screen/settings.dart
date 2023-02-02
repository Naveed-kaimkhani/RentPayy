import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rentpayy/components/logout_popup.dart';
import 'package:rentpayy/utils/routes/RoutesName.dart';
import 'package:rentpayy/utils/style/AppColors.dart';
import 'package:rentpayy/view/forgot_password/password_option.dart';
import 'package:rentpayy/view/user_screen/personal_data.dart';
import '../../components/profilePic.dart';
import '../../model/UserModel.dart';
import '../../view_model/UserDetailsProvider.dart';
import 'booking_history.dart';
import 'faq_screen.dart';

class setting_screen extends StatelessWidget {
  const setting_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModel? user =
        Provider.of<UserDetailsProvider>(context, listen: false).userDetails;
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          Navigator.pushNamed(context, RoutesName.navigation_page);
          return true;
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          // appBar: AppBar(
          //   elevation: 0,
          //   backgroundColor: Colors.white,
          // ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 27.w, top: 36.h, right: 27.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      profilePic(
                        url: user!.profileImage,
                        height: 62.h,
                        width: 62.w,
                      ),
                      SizedBox(
                        width: 13.w,
                      ),
                      Text(
                        user.name!,
                        style: TextStyle(
                            fontSize: 22.sp, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  ExpansionTile(
                    title: Text("Account"),
                    // leading: Image.asset("asset/yellowprofile.png"),
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
                                      builder: (context) => personal_data()));
                            },
                            // leading: Image.asset("asset/yellowprofile2.png"),
                            leading: settingScreen_Miniicon(icon: Icons.person),
                            title: Row(
                              children: [
                                Text("Personal Data"),
                                SizedBox(
                                  width: 80.w,
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
                                      builder: (context) => password_option()));
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
                    // leading: Image.asset("asset/paymentyellow.png"),
                    leading: settingScreen_icon(icon: Icons.payments_outlined),
                  ),
                  ExpansionTile(
                    title: Text("Help and Support"),
                    // leading: Image.asset("asset/help.png"),
                    leading: settingScreen_icon(icon: Icons.help),
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 45.w),
                        child: ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => faq_screen()));
                            },
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
                    title: InkWell(
                        child: Text("Booking History"),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const booking_history()));
                        }),
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
                            showLogoutPopup(context);
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
