import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/utils/style/AppColors.dart';

class Point_increament_button extends StatelessWidget {
  Point_increament_button(
      {required this.minus,
      required this.plus,
      required this.increment,
      Key? key})
      : super(key: key);

  int increment;
  Function()? minus;
  Function()? plus;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        return Container(
          width: 179.w,
          height: 60.h,
          child: Row(
            children: [
              InkWell(
                  child: Container(
                    width: 44.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(7.h),
                        bottomLeft: Radius.circular(7.r),
                      ),
                    ),
                    child: Icon(Icons.remove),
                  ),
                  onTap: minus),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.textfieldsColor,
                    border: Border(
                        left: BorderSide(color: Colors.black, width: 1),
                        right: BorderSide(color: Colors.black, width: 1))),
                width: 91.w,
                height: 60.h,
                child: Container(
                  color: AppColors.textfieldsColor,
                  child: Center(
                      child: Text(
                    increment.toString(),
                    textAlign: TextAlign.center,
                  )),
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
                  child: Icon(Icons.add),
                ),
                onTap: plus,
              ),
            ],
          ),
        );
      },
    );
  }
}
