import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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

// class TsClip1 extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     path.lineTo(0, size.height-420);
//     // path.lineTo(size.width, size.height-400);
//     // path.lineTo(size.width, 0);
//     path.quadraticBezierTo(
//         size.width*0.5, size.height - 450, size.width, size.height-420); 
//     // path.quadraticBezierTo(
//     //     0, size.height - 450, size.width, size.height-430);
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
// }
// class MyClipper extends CustomClipper<Path> {
//   Path getClip(Size size) {
//     var path = Path();
//     path.lineTo(0, size.height - 70);
//     var controllpoint = Offset(50, size.height);
//     var endPoint = Offset(size.width / 2, size.height);
//     path.quadraticBezierTo(
//         controllpoint.dx, controllpoint.dy, endPoint.dx, endPoint.dy);
//     path.lineTo(size.width, size.height);
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     // TODO: implement shouldReclip
//     return true;
//   }
// }
