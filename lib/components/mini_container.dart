import 'package:flutter/material.dart';

class MiniContainer extends StatelessWidget {
  final double height;
  final double width;
  final String image;
  const MiniContainer({Key? key, required this.height, required this.width, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xffFBEFD4),
      ),
      child: Image.asset(image),
    );
  }
}
