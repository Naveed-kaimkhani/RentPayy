import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/utils/style/AppColors.dart';

class ad_page_container extends StatelessWidget {
  final String text;
  // final String image;
  const ad_page_container({Key? key, required this.text,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 10.h,
          width: 10.w,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            shape: BoxShape.circle,
            // image: DecorationImage(
            //   image: AssetImage(image),
            // )
          ),
          child: Center(child: Icon(Icons.check),),
        ),
        SizedBox(width: 6.w,),
        Text(text , style: TextStyle(fontSize: 10.sp , fontWeight: FontWeight.w300),),
      ],
    );
  }
}