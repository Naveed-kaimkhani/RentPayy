import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class no_internetConnection extends StatelessWidget {
  const no_internetConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Image.asset("asset/NoInternet.png"),
        ),
      ),
    );
  }
}