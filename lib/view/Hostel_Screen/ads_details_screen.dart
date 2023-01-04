import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:rentpayy/components/circle_progress.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../../components/ads_header_section.dart';
import '../../components/banner.dart';
import '../../model/AdMobServices.dart';
import '../../utils/style/AppColors.dart';
import '../../utils/style/text_style.dart';
import '../../view_model/HostelDetailsProvider.dart';

class ads_details_screen extends StatefulWidget {
  const ads_details_screen({super.key});

  @override
  State<ads_details_screen> createState() => _ads_details_screenState();
}

class _ads_details_screenState extends State<ads_details_screen> {
  late List<SampleChartData> _chartData;
  BannerAd? _banner;

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

  // Future initializeHostel() async {
  //   await Provider.of<HostelDetailsProvider>(context, listen: false)
  //       .getHostelFromServer(FirebaseAuth.instance.currentUser!.uid, context);
  //   setState(() {});
  //   // for (var i = 0; i < 3; i++) {}
  // }

  @override
  void initState() {
    // initializeHostel();
    // Provider.of<HostelDetailsProvider>(context, listen: false)
    //     .getHostelFromServer(FirebaseAuth.instance.currentUser!.uid, context);
    _chartData = getChartData();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _banner = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: AdMobServices.bannerAdUnitId!,
      listener: AdMobServices.bannerAdListener,
      request: const AdRequest(),
    )..load();
  }

  @override
  Widget build(BuildContext context) {
    // hostelModel? hostel =
    //     Provider.of<HostelDetailsProvider>(context, listen: false)
    //         .hostelDetails;
    Provider.of<HostelDetailsProvider>(context, listen: false)
        .getHostelFromServer(FirebaseAuth.instance.currentUser!.uid, context);
    // print(hostel!.name);
    final Size = MediaQuery.of(context).size;
    return SafeArea(
      top: true,
      bottom: true,
      // child: ads_ki_details(Size: Size, hostel: hostel),
      child: Scaffold(
        bottomNavigationBar: _banner == null
            ? Container(
                child: Text("No ad found"),
              )
            : Container(
                margin: const EdgeInsets.only(bottom: 12),
                height: 52.h,
                child: AdWidget(ad: _banner!),
              ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('hostels')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return circle_progress();
              } else if (snapshot.hasError) {
                return Text("No data found");
              } else {
                return Scaffold(
                  // appBar: SellerAppBar(height: 160),

                  body: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
                    child: ListView(
                      children: [
                        HeaderSection(
                          Size: Size,
                          hostelName: snapshot.data!['name'],
                          ImageUrl: snapshot.data!['pictures'][0] ??
                              "https://tse4.mm.bing.net/th?id=OIP.iYpFSu2O2kVP1OptEdJ-uwHaHx&pid=Api&P=0",
                        ),
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

                        AdsCard(
                          visits: snapshot.data!['visits'],
                          cancel: snapshot.data!['cancel'],
                          confirms: snapshot.data!['confirms'],
                          bookings: snapshot.data!['bookings'],
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        // Banner Images
                        banner()
                      ],
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }
}

class AdsCard extends StatefulWidget {
  final visits;
  final bookings;
  final cancel;
  final confirms;
  const AdsCard({
    required this.visits,
    required this.bookings,
    required this.cancel,
    required this.confirms,
    Key? key,
  }) : super(key: key);

  @override
  State<AdsCard> createState() => _AdsCardState();
}

class _AdsCardState extends State<AdsCard> {
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
                                widget.visits.toString(),
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
                                widget.bookings.toString(),
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
                                widget.confirms.toString(),
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
                                widget.cancel.toString(),
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
