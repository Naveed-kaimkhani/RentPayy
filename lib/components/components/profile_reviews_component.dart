import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/style/Images.dart';

class ProfileReviewsComponent extends StatelessWidget {
  const ProfileReviewsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          Images.profile,
        ),
        Padding(
          padding: EdgeInsets.only(left: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ayesha Ahmed',
                style: TextStyle(
                    fontSize: 12.sp, fontWeight: FontWeight.w500),
              ),
              Text(
                'Best Hostel highly recommend , Thanks to RentPayy',
                style: TextStyle(
                    fontWeight: FontWeight.w400, fontSize: 10.sp),
              ),
            ],
          ),
        ),
        SizedBox(width: 50.w,),
        Column(
          children: [
            Row(
              children: [
                Icon(Icons.star , color: Colors.yellow, size: 12,),
                Icon(Icons.star , color: Colors.yellow, size: 12,),
                Icon(Icons.star , color: Colors.yellow, size: 12,),
                Icon(Icons.star , color: Colors.yellow, size: 12,),
                Icon(Icons.star , color: Colors.yellow, size: 12,),
              ],
            ),
            Text('12/4/2022' , style: TextStyle(fontSize: 10.sp , fontWeight: FontWeight.w300),),
          ],
        ),
      ],
    );
  }
}
