import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class shimmer_hostel_container extends StatelessWidget {
  shimmer_hostel_container({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.withOpacity(0.5),
        highlightColor: Colors.white,
        child: Container(
          margin: EdgeInsets.only(left: 10),
          height: 187.h,
          width: 198.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 125.h,
                width: 187.w,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.r),
                      topRight: Radius.circular(30.r)),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3.0),
                child: Row(
                  children: [
                    Container(
                      width: 110.w,
                      height: 35.h,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Container(
                      color: Colors.grey.withOpacity(0.5),
                      width: 50.w,
                      height: 35.h,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              )
            ],
          ),
        ));
  }
}
