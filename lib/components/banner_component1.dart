import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/style/AppColors.dart';
import 'mini_container.dart';

class banner_component1 extends StatelessWidget {
  const banner_component1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 393.w,
      height: 185.h,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Stack(
        children: [
          Positioned(
              left: 17.w,
              top: 8.h,
              child: MiniContainer(
                  height: 40.h, width: 40.w, image: 'asset/books.png')),
          Positioned(
            left: 12.w,
            top: 57.h,
            child: MiniContainer(
              height: 42.h,
              width: 42.w,
              image: 'asset/sofa.png',
            ),
          ),
          Positioned(
              left: 17.w,
              top: 120.h,
              child: MiniContainer(
                  height: 42.h, width: 42.w, image: 'asset/headphone.png')),
          Positioned(
              left: 87.w,
              top: 35.h,
              child: MiniContainer(
                  height: 42.h, width: 42.w, image: 'asset/shirt.png')),
          Positioned(
              left: 284.w,
              top: 8.h,
              child: MiniContainer(
                  height: 52.h, width: 52.w, image: 'asset/books.png')),
          Positioned(
              left: 324.w,
              top: 60.h,
              child: MiniContainer(
                  height: 45.h, width: 45.w, image: 'asset/house.png')),
          Positioned(
              left: 288.w,
              top: 120.h,
              child: MiniContainer(
                  height: 45.h, width: 45.w, image: 'asset/building.png')),
          Positioned(
              top: 65.h,
              left: 91.w,
              right: 91.w,
              child: Column(
                children: [
                  Text(
                    'All In One ',
                    style: TextStyle(
                        color: AppColors.primaryColor, fontSize: 21.sp),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Text(
                    'With Rentapayy, which shortens the distance between a service provider and receiver. ',
                    style: TextStyle(color: Colors.white, fontSize: 11.sp),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
