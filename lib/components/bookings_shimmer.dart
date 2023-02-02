import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class bookings_shimmer extends StatelessWidget {
  bookings_shimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.withOpacity(0.5),
        highlightColor: Colors.white,
        child: Container(
          padding: EdgeInsets.only(left: 14.w, right: 19.w),
          height: 150.h,
          width: 396.w,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.5),
  
            // border: BorderRadius.circular(Radius.circular(radius)),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              con(),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 20.h,
                width: 120.w,
                color: Colors.grey.withOpacity(0.5),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 190.0),
                child: Container(
                  height: 40.h,
                  width: 130.w,
                  color: Colors.grey.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ));
  }
}

class con extends StatelessWidget {
  const con({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 170.w,
      color: Colors.grey.withOpacity(0.5),
    );
  }
}
