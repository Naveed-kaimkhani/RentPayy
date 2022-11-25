import 'package:flutter/material.dart';
import 'package:rentpayy/components/circle_progress.dart';

class home_screen extends StatelessWidget {
  const home_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: circle_progress(),
      ),
    );
  }
}
