import 'package:flutter/material.dart';

import 'package:rentpayy/components/hostel_appBarButton.dart';

import '../../components/search_bar.dart';
import '../../utils/style/AppColors.dart';
import '../../utils/style/Images.dart';

class search_screen extends StatelessWidget {
  const search_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: (() =>
                // Navigator.pushNamed(context, RoutesName.user_front_screen)
                Navigator.pop(context)),
            icon: hostel_appBarButton(
                Buttoncolor: AppColors.primaryColor,
                IconUrl: Images.whitebackButton),
            //  Container(
            //   height: 32,
            //   width: 32,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(30),
            //     color: AppColors.primaryColor,
            //   ),
            //   child: Center(child: Image.asset(Images.whitebackButton)),
            // ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: search_bar(
            isReadOnly: false,
            color: AppColors.textfieldsColor,
          ),
        )
        // Column(
        //   children: [
        //     Container(
        //       height: 100,
        //       width: 100,
        //       color: Colors.black,
        //     )
        //   ],
        // ),
        );
  }
}
