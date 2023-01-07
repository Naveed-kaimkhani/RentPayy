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
              height: 30.h,
              width: 30.w,
              image: 'asset/car3.png',
            ),
          ),
          Positioned(
            left: 12.w,
            top: 57.h,
            child: MiniContainer(
              height: 61.h,
              width: 61.w,
              image: 'asset/cloth3.png',
            ),
          ),
          Positioned(
            left: 17.w,
            top: 135.h,
            child: MiniContainer(
              height: 40.h,
              width: 40.w,
              image: 'asset/books3.png',
            ),
          ),
          Positioned(
            left: 87.w,
            top: 52.h,
            child: MiniContainer(
              height: 33.h,
              width: 33.w,
              image: 'asset/headPhone3.png',
            ),
          ),
          Positioned(
            left: 284.w,
            top: 8.h,
            child: MiniContainer(
              height: 40.h,
              width: 40.w,
              image: 'asset/books3.png',
            ),
          ),
          Positioned(
            left: 324.w,
            top: 60.h,
            child: MiniContainer(
              height: 58.h,
              width: 58.w,
              image: 'asset/building3.png',
            ),
          ),
          Positioned(
            left: 288.w,
            top: 133.h,
            child: MiniContainer(
              height: 30.h,
              width: 30.w,
              image: 'asset/sofa3.png',
            ),
          ),
          Positioned(
            left: 359.w,
            top: 143.h,
            child: MiniContainer(
              height: 30.h,
              width: 30.w,
              image: 'asset/headPhone3.png',
            ),
          ),
          Positioned(
              top: 65.h,
              left: 91.w,
              right: 91.w,
              child: Column(
                children: [
                  Text(
                    'All In One ',
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 21.sp),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor  ',
                    style: TextStyle(
                        color: Colors.white, fontSize: 11.sp),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
