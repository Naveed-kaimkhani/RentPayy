import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class booking_info_shimmer extends StatelessWidget {
  booking_info_shimmer({Key? key}) : super(key: key);

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
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              space(),
              text(),
              space(),
              text(),
              space(),
              text(),
              space(),
              text(),
              // space(),
            ],
          ),
        ));
  }
}

class space extends StatelessWidget {
  const space({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15.h,
    );
  }
}

class text extends StatelessWidget {
  const text({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      width: 160.w,
      color: Colors.grey.withOpacity(0.5),
    );
  }
}
