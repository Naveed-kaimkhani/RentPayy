import 'package:flutter/material.dart';
class UserSellerComponent extends StatelessWidget {
  final double height;
  final double width;
  final String image;
  final String text;
  final Function() ontap;
   UserSellerComponent({Key? key, required this.height,
    required this.width, required this.image, required this.text, required this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: ontap,
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xff000000)),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Image.asset(image ,),
          ),
        ),
        const SizedBox(height: 10,),
        Text(text, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold ,),)
      ],
    );
  }
}
