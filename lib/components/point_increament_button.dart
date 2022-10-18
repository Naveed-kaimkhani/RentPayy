import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/utils/style/AppColors.dart';

import '../utils/style/Images.dart';

class Point_increament_button extends StatelessWidget {


  Point_increament_button(
      {
        required this.pointscotroller,
        Key? key}
      ) : super(key: key);


  TextEditingController pointscotroller =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 179.w,
      height: 60.h,
      child: Row(
        children: [
      InkWell(
      child:
          Container(
            width: 44.w,
            height: 60.h,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(7.h),
                bottomLeft: Radius.circular(7.r),
              ),
            ),
            child: Image.asset(Images.minus),
          ),
        onTap: () {print("Minus");},
      ),
          Container(
            decoration: BoxDecoration( color: AppColors.textfieldsColor,
              border: Border(
                left: BorderSide(
                  color: Colors.black,
                  width: 1
                ),
                right: BorderSide(
                  color: Colors.black,
                  width: 1
                )
              )
            ),
            width: 91.w,
            child: TextField(
              textAlign: TextAlign.center,
              controller: pointscotroller,
              decoration: InputDecoration(
                hintText: "0",
                border: InputBorder.none
              )
            ),
          ),
          InkWell(
            child: Container(
              width: 44.w,
              height: 60.h,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(7.r),
                  bottomRight: Radius.circular(7.r),
                ),
              ),
              child: Image.asset(Images.plus),
            ),
            onTap: () {print("Plus"); },
          ),
        ],
      ),
    );
  }
}
