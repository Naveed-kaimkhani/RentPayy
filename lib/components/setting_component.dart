import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/style/Images.dart';

class setting_component extends StatelessWidget {
  final String text;
  const setting_component({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 67.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(Images.profile1),
              SizedBox(width: 13.w,),
              Text(text , style: TextStyle(fontWeight: FontWeight.w300),),
            ],
          ),
          IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios , size: 15,))
        ],
      ),
    );
  }
}
