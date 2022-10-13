import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onPress;
  const MyButton({Key? key, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 67,
        width: 300,
        decoration: BoxDecoration(
          color: const Color(0xffF5AD0D),
              borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Text(
            'Get Started',
            style: TextStyle(color: Color(0xffFFFFFF) , fontSize: 17),
          ),
        ),
      ),
    );
  }
}
