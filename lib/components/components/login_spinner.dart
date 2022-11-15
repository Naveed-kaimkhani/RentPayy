import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rentpayy/utils/style/AppColors.dart';

class login_spinner extends StatelessWidget {
  const login_spinner({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitCircle(
          size: 150.r,
          itemBuilder: (context , index){
            final colors = [AppColors.primaryColor , Colors.grey.withOpacity(0.5)];
            final color = colors[index % colors.length];
            return DecoratedBox(decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),);
          },
        ),
    );

  }
}
