import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rentpayy/components/custom_appbar.dart';
import 'package:rentpayy/utils/style/AppColors.dart';

class login_with_rentpayy extends StatelessWidget {
  const login_with_rentpayy({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
        backgroundColor: AppColors.primaryColor,

        appBar: custom_appbar(),
        body: Container(
          
        ),
        ));
  }
}