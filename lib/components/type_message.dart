import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/style/AppColors.dart';

class type_message extends StatefulWidget {
  const type_message({super.key});

  @override
  State<type_message> createState() => _type_messageState();
}

class _type_messageState extends State<type_message> {
  String message = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 42.h,
              decoration: BoxDecoration(
                  color: AppColors.textfieldsColor,
                  borderRadius: BorderRadius.circular(10.r)),
              child: TextField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: " Type message",
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 106, 103, 103),
                    fontSize: 17.sp,
                  ),

                ),
                onChanged: (value)=>setState(() {
                  message=value;
                }),
              ),
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          InkWell(
            child: Container(
              height: 42.h,
              width: 40.w,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Icon(
                  Icons.send,
                  color: Colors.white,
                ),
              ),
            ),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
