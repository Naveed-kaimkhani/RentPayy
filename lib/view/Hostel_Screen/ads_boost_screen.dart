import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/utils/style/AppColors.dart';
import 'package:rentpayy/utils/style/Images.dart';

import '../../utils/style/text_style.dart';

class AdBoostScreen extends StatelessWidget {
  const AdBoostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double iconSize = 15;
    double gap = 8;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(leading: Image.asset(Images.backIcon)),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
                child: Text(
              "Choose Your\n Plan",
              textAlign: TextAlign.center,
              style: CustomTextStyle.headingsAll_26,
            )),
            SizedBox(
              height: 30,
            ),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 400.w,
                  height: 580.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  child: ListView(
                    children: [
                      // Grey background Container
                      Container(
                        width: 400.w,
                        height: 200.h,
                        decoration: BoxDecoration(
                            color: AppColors.greyBackgroundCOlor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            )),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Basic",
                              style: CustomTextStyle.font_33,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 50),
                              child: RichText(
                                  text: TextSpan(
                                      text: '500',
                                      style: CustomTextStyle.font_54,
                                      children: [
                                    TextSpan(
                                        text: 'Rs/month',
                                        style: CustomTextStyle.font_13)
                                  ])),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 30, 20, 0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.check,
                                  color: Colors.black,
                                  size: iconSize,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('Unlimited ticket')
                              ],
                            ),
                            SizedBox(
                              height: gap,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.check,
                                  color: Colors.black,
                                  size: iconSize,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('Ipsum dolor sit amet, consectetur ')
                              ],
                            ),
                            SizedBox(
                              height: gap,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.check,
                                  color: Colors.black,
                                  size: iconSize,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('Consectetur adipiscing elit ')
                              ],
                            ),
                            SizedBox(
                              height: gap,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.check,
                                  color: Colors.black,
                                  size: iconSize,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('Lorem ipsum dolor sit amet ')
                              ],
                            ),
                            SizedBox(
                              height: gap,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.check,
                                  color: Colors.black,
                                  size: iconSize,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('Dolor sit amet')
                              ],
                            ),
                            SizedBox(
                              height: gap,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.check,
                                  color: Colors.black,
                                  size: iconSize,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('Ipsum dolor sit amet, consectetur ')
                              ],
                            ),
                            SizedBox(
                              height: gap,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.check,
                                  color: Colors.black,
                                  size: iconSize,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('Consectetur adipiscing elit ')
                              ],
                            ),
                            SizedBox(
                              height: gap,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.check,
                                  color: Colors.black,
                                  size: iconSize,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('Lorem ipsum dolor sit amet ')
                              ],
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      // Buy Now Button
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 30, 20, 0),
                        child: SizedBox(
                          width: 300.w,
                          height: 60.h,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: AppColors.primaryColor,
                              ),
                              onPressed: () {},
                              child: Text("Buy Now")),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),

                // Half Circle Icon
                Positioned(
                  right: 165.w,
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: AppColors.primaryColor,
                    child: Image.asset(
                      Images.electricity,
                      fit: BoxFit.cover,
                      width: 25,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
