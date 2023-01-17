import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/utils/style/AppColors.dart';
import 'package:rentpayy/utils/style/Images.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../utils/routes/RoutesName.dart';
import '../../utils/style/text_style.dart';

class ad_boost_screen extends StatefulWidget {
  const ad_boost_screen({super.key});

  @override
  State<ad_boost_screen> createState() => _ad_boost_screenState();
}

class _ad_boost_screenState extends State<ad_boost_screen> {
  var controller;
  @override
  void initState() {
    // TODO: implement initState
    controller = PageController(viewportFraction: 0.8);
    super.initState();
  }

  Widget build(BuildContext context) {
    List<String> pricingPlanHeading = ['Basic', 'Standard', 'Premium'];
    List pricingPlan = [500, 100, 1500];
    double iconSize = 15;
    double gap = 8;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamed(context, RoutesName.SellerDashboard);
        return true;
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 48),
              child: Center(
                  child: Text(
                "Choose Your\n Plan",
                textAlign: TextAlign.center,
                style: CustomTextStyle.headingsAll_26,
              )),
            ),
            Container(
              // width: 600.w,
              height: 520,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: PageView(
                      controller: controller,
                      children: [
                        PricingPlanCard(
                            pricingPlanHeading: 'Basic',
                            pricingPlan: 500,
                            iconSize: iconSize,
                            gap: gap),
                        PricingPlanCard(
                            pricingPlanHeading: 'Standard',
                            pricingPlan: 1000,
                            iconSize: iconSize,
                            gap: gap),
                        PricingPlanCard(
                            pricingPlanHeading: 'Premium',
                            pricingPlan: 1500,
                            iconSize: iconSize,
                            gap: gap),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    axisDirection: Axis.horizontal,
                    effect: WormEffect(
                      activeDotColor: Colors.white,
                      dotHeight: 10,
                      dotColor: Colors.white54,
                      dotWidth: 10,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PricingPlanCard extends StatelessWidget {
  const PricingPlanCard({
    Key? key,
    required this.pricingPlanHeading,
    required this.pricingPlan,
    required this.iconSize,
    required this.gap,
  }) : super(key: key);

  final String pricingPlanHeading;
  final int pricingPlan;
  final double iconSize;
  final double gap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
          // margin: EdgeInsets.only(top: 20),
          width: double.infinity,
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
                margin: EdgeInsets.zero,
                width: double.infinity,
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
                      pricingPlanHeading,
                      style: CustomTextStyle.font_33,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: RichText(
                          text: TextSpan(
                              text: pricingPlan.toString(),
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
                        Text('Ipsum dolor sit amet,\n consectetur ')
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
                        Text('Ipsum dolor sit amet,\n consectetur ')
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
              // Spacer(),
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
                      onPressed: () {
                        //utils.flushBarErrorMessage('Thanks', context);
                      },
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
          right: 140.w,
          child: CircleAvatar(
            radius: 22,
            backgroundColor: AppColors.primaryColor,
            child: Image.asset(
              Images.boost,
              fit: BoxFit.cover,
              width: 25,
            ),
          ),
        ),
      ],
    );
  }
}
