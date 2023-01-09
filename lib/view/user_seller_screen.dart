import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/components/custom_appbar.dart';
import 'package:rentpayy/view/Hostel_Screen/login_Signup_forHostel.dart';
import 'package:rentpayy/view/user_screen/login_screen.dart';
import '../components/user_seller_component.dart';

class UserSellerScreen extends StatelessWidget {
  const UserSellerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF5AD0D),
        appBar: custom_appbar(),
        body: Stack(
          children: [
            Container(
              height: 833.h,
              width: 428.w,
              decoration: const BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 139.h,
                  ),
                  UserSellerComponent(
                    height: 189.01.h,
                    width: 199.w,
                    image: 'asset/female.png',
                    text: "User",
                    ontap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => login_screen(),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 112.h,
                  ),
                  UserSellerComponent(
                      height: 189.01.h,
                      width: 199.w,
                      image: 'asset/male.png',
                      text: "Seller",
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => login_Signup_forHostel(),
                          ),
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
