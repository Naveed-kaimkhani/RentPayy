import 'package:flutter/material.dart';
import 'package:rentpayy/utils/routes/RoutesName.dart';

class chat_screen extends StatelessWidget {
  const chat_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.popAndPushNamed(context, RoutesName.navigation_page);
        return true;
      },
      child: Scaffold(
        body: Center(
          child: Image.asset('asset/comingsoon.png'),
        ),
      ),
    );
  }
}
