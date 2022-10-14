import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/components/custom_appbar.dart';

import '../components/mini_container.dart';
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
                color: Color(0xffFFFFFF),
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
                      text: "User"),
                  SizedBox(
                    height: 112.h,
                  ),
                  UserSellerComponent(
                      height: 189.01.h,
                      width: 199.w,
                      image: 'asset/male.png',
                      text: "Seller"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
