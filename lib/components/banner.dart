import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class banner extends StatelessWidget {
  const banner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   SingleChildScrollView(
      child: Container(
        height: 185.h,
        width: 393.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Color.fromRGBO(245, 173, 13, 1),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 60.h, left: 18.w),
                  child: Text(
                    'Rent in just 3 steps!',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 21.sp,
                        color: Color.fromRGBO(0, 0, 0, 1)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 18.w, right: 154.w),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur '
                        'adipiscing elit, sed do eiusmod tempor ',
                    style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                )
              ],
            ),
            Positioned(
              top: 7.h,
              left: 209.w,
              right: 149.w,
              child: Image.asset('asset/headphone.png'),
            ),
            Positioned(
              top: 3.h,
              left: 279.w,
              right: 69.w,
              child: Image.asset('asset/sofa.png'),
            ),
            Positioned(
              top: 28.h,
              left: 351.w,
              right: 9.w,
              child: Image.asset('asset/books.png'),
            ),
            Positioned(
              top: 47.h,
              left: 279.w,
              right: 54.w,
              child: Image.asset('asset/shirt.png'),
            ),
            Positioned(
              top: 148.h,
              left: 239.w,
              right: 84.w,
              child: Image.asset('asset/car1.png'),
            ),
            Positioned(
              top: 136.h,
              left: 343.w,
              right: 1.76.w,
              child: Image.asset('asset/building.png'),
            ),
          ],
        ),
      ),
    );
  }
}
