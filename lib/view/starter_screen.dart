import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/components/authButton.dart';
import 'package:rentpayy/view/user_seller_screen.dart';
import '../components/mini_container.dart';

class StarterScreen extends StatelessWidget {
  const StarterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF5AD0D),
        body: Stack(
          children: [
            Positioned(
                left: 41.w,
                top: 159.h,
                child: MiniContainer(
                  height: 42.h,
                  width: 42.w,
                  image: 'asset/sofa.png',
                )),
            Positioned(
                left: 336.w,
                top: 63.h,
                child: MiniContainer(
                  height: 42.h,
                  width: 42.w,
                  image: 'asset/sofa.png',
                )),
            Positioned(
                left: 358.w,
                top: 311.h,
                child: MiniContainer(
                    height: 92.h, width: 92.w, image: 'asset/headphone.png')),
            Positioned(
                left: -2.w,
                top: 362.h,
                child: MiniContainer(
                    height: 102.h, width: 102.w, image: 'asset/shirt.png')),
            Positioned(
                left: 343.w,
                top: 430.h,
                child: MiniContainer(
                    height: 52.h, width: 52.w, image: 'asset/books.png')),
            Positioned(
                left: 138.w,
                top: 168.h,
                child: MiniContainer(
                    height: 162.h, width: 162.w, image: 'asset/house.png')),
            Positioned(
                left: 261.w,
                child: MiniContainer(
                    height: 82.h, width: 82.w, image: 'asset/building.png')),
            Positioned(
              top: 548.h,
              child: Container(
                height: 378.h,
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
                      height: 29.h,
                    ),
                    // Image(image: AssetImage('asset/rentB1.png') , width: 160.w, height: 42.4.h,),
                    Image(
                      image: AssetImage('asset/splash.png'),
                      height: 90.1.h,
                      width: 140.w,
                    ),
                    SizedBox(
                      height: 25.6.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 50.w),
                      child: Text(
                        "Facing problems while renting something? \n        Say No More! Rentpayy is here.",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                    authButton(
                        text: 'Get Started',
                        func: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserSellerScreen()));

                        },
                        color: Color(0xffF5AD0D))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
