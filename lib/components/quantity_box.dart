import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/style/AppColors.dart';

class QuanityBox extends StatefulWidget {
  final int Quantity;
  Function()? plus;
  Function()? minus;
  
  QuanityBox({
    required this.Quantity,
    required this.plus,
    required this.minus,
    Key? key,
  }) : super(key: key);

  @override
  State<QuanityBox> createState() => _QuanityBoxState();
}

class _QuanityBoxState extends State<QuanityBox> {
  int quanity = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: 150.h,
      height: 60.h,
      decoration: BoxDecoration(
        color: AppColors.greyBackgroundCOlor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            radius: 15,
            backgroundColor: AppColors.primaryColor,
            child: GestureDetector(
              onTap:widget.minus,  
              child: Icon(
                Icons.remove,
                color: Colors.white,
              ),
            ),
          ),
          Text(widget.Quantity.toString()),
          CircleAvatar(
            radius: 15,
            backgroundColor: AppColors.primaryColor,
            child: GestureDetector(
              onTap: widget.plus,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
