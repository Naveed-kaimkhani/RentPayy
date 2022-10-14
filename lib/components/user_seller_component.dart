import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserSellerComponent extends StatelessWidget {
  final double height;
  final double width;
  final String image;
  final String text;
  const UserSellerComponent({Key? key, required this.height,
    required this.width, required this.image, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xff000000)),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Image.asset(image ,),
        ),
        const SizedBox(height: 10,),
        Text(text, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold ,),)
      ],
    );
  }
}
