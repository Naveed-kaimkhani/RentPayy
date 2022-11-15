import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserScreenContainer extends StatelessWidget {
  final String image;
  final String text;
  const UserScreenContainer({Key? key, required this.image, required this.text,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: Column(
        children: [
          Image(image: AssetImage(image)),
          SizedBox(height: 4.h,),
          Text(text , style: TextStyle(fontSize: 10.sp , fontWeight: FontWeight.w500 , color: Colors.black),)
        ],
      ),
    );
  }
}
