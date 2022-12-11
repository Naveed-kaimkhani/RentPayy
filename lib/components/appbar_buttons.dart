
import 'package:flutter/material.dart';

import '../utils/style/AppColors.dart';

class appbar_buttons extends StatelessWidget {
  const appbar_buttons({
    super.key,
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 31,
      width: 31,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Center(
        child: Icon(
          icon,
          // Icons.arrow_back_ios,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
