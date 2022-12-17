import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../../components/ads_header_section.dart';
import '../../components/banner.dart';
import '../../utils/style/AppColors.dart';
import '../../utils/style/text_style.dart';

class AdsDetailScreen extends StatefulWidget {
  const AdsDetailScreen({super.key});

  @override
  State<AdsDetailScreen> createState() => _AdsDetailScreenState();
}

class _AdsDetailScreenState extends State<AdsDetailScreen> {
  late List<SampleChartData> _chartData;

  List<SampleChartData> getChartData() {
    return <SampleChartData>[
      SampleChartData(
        x: DateTime(2016, 12, 10),
        high: 116.73,
        close: 115.98,
        open: 113.23,
      )
    ];
  }

  @override
  void initState() {
    _chartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
        // appBar: SellerAppBar(height: 160),

        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
          child: ListView(
            children: [
              HeaderSection(Size: Size),
              Text(
                "Ad Performance",
                style: CustomTextStyle.font_16,
              ),
              SizedBox(
                height: 10,
              ),

              // Line Chart
              Container(
                height: 300.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.greyBackgroundCOlor),
                child: Container(
                    child: SfSparkLineChart(
                  axisCrossesAt: 20.5,
                  //Enable the trackball
                  trackball: SparkChartTrackball(
                      activationMode: SparkChartActivationMode.tap),
                  //Enable marker
                  marker: SparkChartMarker(
                      displayMode: SparkChartMarkerDisplayMode.all),
                  //Enable data label
                  labelDisplayMode: SparkChartLabelDisplayMode.all,
                  data: <double>[
                    1,
                    5,
                    -6,
                    0,
                    1,
                    -2,
                    7,
                    -7,
                    -4,
                    -10,
                    13,
                    -6,
                    7,
                    5,
                    11,
                    5,
                    3
                  ],
                )),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Ad Analysis",
                style: CustomTextStyle.font_16,
              ),
              SizedBox(
                height: 10,
              ),
              // Ads Analsis Circular Progress bar
              AdsCard(),

              SizedBox(
                height: 20,
              ),
              // Banner Images
              banner()
            ],
          ),
        ),
      ),
    );
  }
}

class AdsCard extends StatelessWidget {
  const AdsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 200,
                  // width: Size.width,
                  height: 120.h,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(242, 246, 255, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 14.w, right: 15.w, top: 26.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircularPercentIndicator(
                              progressColor: AppColors.primaryColor,
                              radius: 23.0,
                              lineWidth: 5.0,
                              animation: true,
                              percent: 0.7,
                              center: new Text(
                                "10",
                                style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              fit: FlexFit.tight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Views Per day',
                                    style: CustomTextStyle.font_16,
                                  ),
                                  Text(
                                      'Sunt sunt veniam et minim id ea esse anim ex velit ')
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  width: 200,
                  // width: Size.width,
                  height: 120.h,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(242, 246, 255, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 14.w, right: 15.w, top: 26.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircularPercentIndicator(
                              progressColor: AppColors.primaryColor,
                              radius: 23.0,
                              lineWidth: 5.0,
                              animation: true,
                              percent: 0.3,
                              center: new Text(
                                "3",
                                style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              fit: FlexFit.tight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Bookings Per day',
                                    style: CustomTextStyle.font_16,
                                  ),
                                  Text(
                                      'Sunt sunt veniam et minim id ea esse anim ex velit ')
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  width: 200,
                  // width: Size.width,
                  height: 120.h,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(242, 246, 255, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 14.w, right: 15.w, top: 26.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircularPercentIndicator(
                              progressColor: AppColors.primaryColor,
                              radius: 23.0,
                              lineWidth: 5.0,
                              animation: true,
                              percent: 0.8,
                              center: new Text(
                                "08",
                                style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              fit: FlexFit.loose,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Confirms Per day',
                                    style: CustomTextStyle.font_16,
                                  ),
                                  Text(
                                      'Sunt sunt veniam et minim id ea esse anim ex velit ')
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  width: 200,
                  // width: Size.width,
                  height: 120.h,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(242, 246, 255, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 14.w, right: 15.w, top: 26.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircularPercentIndicator(
                              progressColor: AppColors.primaryColor,
                              radius: 23.0,
                              lineWidth: 5.0,
                              animation: true,
                              percent: 0.1,
                              center: new Text(
                                "01",
                                style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              fit: FlexFit.tight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Cancels Per day',
                                    style: CustomTextStyle.font_16,
                                  ),
                                  Text(
                                      'Sunt sunt veniam et minim id ea esse anim ex velit ')
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}

class SampleChartData {
  SampleChartData({
    this.x,
    this.open,
    this.close,
    this.low,
    this.high,
  });
  final DateTime? x;
  final num? open;
  final num? close;
  final num? low;
  final num? high;
}
