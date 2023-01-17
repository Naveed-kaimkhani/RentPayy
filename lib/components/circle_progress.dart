import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rentpayy/utils/style/AppColors.dart';

class circle_progress extends StatelessWidget {
  const circle_progress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitChasingDots(
      color: AppColors.primaryColor,
      size: 50.0,
    );

  }
}
