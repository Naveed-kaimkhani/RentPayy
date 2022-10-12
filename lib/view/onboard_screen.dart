import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rentpayy/utils/style/AppColors.dart';

class onboard_screen extends StatelessWidget {
  const onboard_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
            onPressed: (() => Navigator.pop(context)),
            icon: SvgPicture.asset('asset/back.svg'),
            ),
      ),
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.only(top: 32.h),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(53), topRight: Radius.circular(53)),
            color: Colors.white),
      )),
    );
  }
}
