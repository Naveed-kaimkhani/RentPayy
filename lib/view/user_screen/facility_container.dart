import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/utils/style/AppColors.dart';

class facility_container extends StatelessWidget {
  final String text;
  // final String image;
  const facility_container({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.zero,
          height: 16.h,
          width: 16.w,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            shape: BoxShape.circle,
            // image: DecorationImage(
            //   image: AssetImage(image),
            // )
          ),
          child: Center(
            child: Icon(
              Icons.check,
              size: 14.h,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: 6.w,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w300),
        ),
      ],
    );
  }
}
