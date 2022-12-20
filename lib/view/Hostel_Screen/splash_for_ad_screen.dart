import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreenForAd extends StatelessWidget {
  const SplashScreenForAd({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.of(context).size;
    return SafeArea(
        top: true,
        bottom: true,
        child: Scaffold(
          body: Column(
            children: [
              Container(
                width: 500.w,
                height: 160.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35.r),
                    topRight: Radius.circular(35.r),
                  ),
                  color: Color.fromRGBO(242, 246, 255, 1),
                ),
              ),
            ],
          ),
        ));
  }
}
