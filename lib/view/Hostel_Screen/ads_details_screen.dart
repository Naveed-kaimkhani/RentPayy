// import 'package:charts_flutter/flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:rentpayy/components/circle_progress.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../../components/ads_header_section.dart';
import '../../components/banner.dart';
import '../../components/exit_pop.dart';
import '../../model/AdMobServices.dart';
import '../../model/BarCharts.dart';
import '../../utils/style/AppColors.dart';
import '../../utils/style/text_style.dart';
import '../../view_model/HostelDetailsProvider.dart';

class ads_details_screen extends StatefulWidget {
  const ads_details_screen({super.key});

  @override
  State<ads_details_screen> createState() => _ads_details_screenState();
}

class _ads_details_screenState extends State<ads_details_screen> {
  BannerAd? _banner;

  @override
  void initState() {
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

  List<charts.Series<BarCharts, String>> initializeCharts(snapshot) {
    final List<BarCharts> data = [
      BarCharts(
          label: "View",
          value: snapshot.data!['visits'],
          color: charts.ColorUtil.fromDartColor(Colors.blueGrey)),
      BarCharts(
          label: "Bookings",
          value: snapshot.data!['bookings'],
          color: charts.ColorUtil.fromDartColor(Colors.green)),
      BarCharts(
          label: "confirms",
          value: snapshot.data!['confirms'],
          color: charts.ColorUtil.fromDartColor(Colors.yellow)),
      BarCharts(
          label: "Cancel",
          value: snapshot.data!['cancel'],
          color: charts.ColorUtil.fromDartColor(Colors.red)),
    ];
    List<charts.Series<BarCharts, String>> series = [
      charts.Series(
          id: "Bookings",
          data: data,
          domainFn: (BarCharts series, _) => series.label,
          measureFn: (BarCharts series, _) => series.value,
          colorFn: (BarCharts series, _) => series.color)
    ];
    return series;
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<HostelDetailsProvider>(context, listen: false)
        .getHostelFromServer(FirebaseAuth.instance.currentUser!.uid, context);
    final Size = MediaQuery.of(context).size;
    return SafeArea(
      top: true,
      bottom: true,
      child: WillPopScope(
        onWillPop: () => showExitPopup(context),
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
                  List<charts.Series<BarCharts, String>> series =
                      initializeCharts(snapshot);
                  return Scaffold(
                    body: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
                      child: ListView(
                        children: [
                          HeaderSection(
                            Size: Size,
                            hostelName: snapshot.data!['name'],
                            hostelAddress: snapshot.data!['hostel_address'],
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

                          Container(
                              height: 300.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.greyBackgroundCOlor),
                              child: charts.BarChart(
                                series,
                                animate: true,
                              )),
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
                  // width: 200,
                  // // width: Size.width,
                  // height: 120.h,
                  width: 180.w,
                  // width: Size.width,
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(242, 246, 255, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 12.w, right: 13.w, top: 24.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircularPercentIndicator(
                              progressColor: AppColors.primaryColor,
                              radius: 23.0,
                              lineWidth: 5.0,
                              animation: true,
                              percent: widget.visits / 100.toDouble(),
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
                                    'No. of user view your add',
                                    style: TextStyle(fontSize: 11.sp),
                                  )
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
                  width: 180.w,
                  // width: Size.width,
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(242, 246, 255, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 12.w, right: 13.w, top: 24.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircularPercentIndicator(
                              progressColor: AppColors.primaryColor,
                              radius: 23.0,
                              lineWidth: 5.0,
                              animation: true,
                              percent: widget.bookings / 100.toDouble(),
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
                                    'No. of user booked your hostel',
                                    style: TextStyle(fontSize: 11.sp),
                                  )
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
                  width: 180.w,
                  // width: Size.width,
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(242, 246, 255, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 12.w, right: 13.w, top: 24.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircularPercentIndicator(
                              progressColor: AppColors.primaryColor,
                              radius: 23.0,
                              lineWidth: 5.0,
                              animation: true,
                              percent: widget.confirms / 100.toDouble(),
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
                                    'No. of user confirm their add ',
                                    style: TextStyle(fontSize: 12.sp),
                                  )
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
                  width: 180.w,
                  // width: Size.width,
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(242, 246, 255, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 12.w, right: 13.w, top: 24.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircularPercentIndicator(
                              progressColor: AppColors.primaryColor,
                              radius: 23.0,
                              lineWidth: 5.0,
                              animation: true,
                              percent: widget.cancel / 100.toDouble(),
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
                                    'No. of user cancel their booking',
                                    style: TextStyle(fontSize: 11.sp),
                                  )
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
