import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/style/AppColors.dart';


  Widget custom_payment(String text, String image, int index,int value)
  {

    bool isselected = false;

    return

    StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return InkWell(
            onTap: () {
              setState(() {
                value = index;
                isselected = !isselected;
              });
            },
            child: Container(
              width: 392.w,
              height: 61.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.textfieldsColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: 21.w, top: 13.h, bottom: 12.h, right: 15.w),
                        child: Image.asset(image),
                      ),
                      Text(
                        text,
                        style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                    Radio(value: index, groupValue: value, onChanged:(values)
                    {
                      setState(() {
                        value = values!;
                      });
                    })
                ],
              ),
            ),
          );
        });
  }

