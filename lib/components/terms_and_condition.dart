import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class terms_and_conditions extends StatelessWidget {
  const terms_and_conditions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "If you continue, you are accepting RentPayy Terms and Conditions\n                                         and Privacy Policy",
      style: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
