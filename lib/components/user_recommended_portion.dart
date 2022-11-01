import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserRecommededPortion extends StatelessWidget {
  final String text;
  final String image;
  const UserRecommededPortion({Key? key, required this.text, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w300,
              color: Colors.black),
        ),
        SizedBox(
          width: 5.w,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            height: 15.h,
            width: 15.w,
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: Image.asset(image),
          ),
        )
      ],
    );
  }
}
