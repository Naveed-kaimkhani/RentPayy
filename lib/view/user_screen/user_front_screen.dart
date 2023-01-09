import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rentpayy/components/no_internetConnection.dart';
import 'package:rentpayy/components/shimmer_hostel_container.dart';
import 'package:rentpayy/model/UserModel.dart';
import 'package:rentpayy/view/user_screen/add_page.dart';

import '../../components/banner.dart';
import '../../components/exit_pop.dart';
import '../../components/hostel_container.dart';
import '../../components/profilePic.dart';
import '../../components/search_bar.dart';
import '../../model/AdMobServices.dart';
import '../../model/hostelModel.dart';
import '../../resources/FirebaseMethods.dart';
import '../../view_model/UserDetailsProvider.dart';
import 'package:provider/provider.dart';

class user_front_Screen extends StatefulWidget {
  const user_front_Screen({Key? key}) : super(key: key);

  @override
  State<user_front_Screen> createState() => _user_front_ScreenState();
}

class _user_front_ScreenState extends State<user_front_Screen> {
  final ScrollController _scrollViewController = ScrollController();
  bool _showAppbar = true;
  bool isScrollingDown = false;
  BannerAd? _banner;
  InterstitialAd? _interstitialAd;

  void showInterstialAd() {
    if (_interstitialAd != null) {
      _interstitialAd!.fullScreenContentCallback =
          FullScreenContentCallback(onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        _createInterstitialAd();
      }, onAdFailedToShowFullScreenContent: (ad, error) {
        ad.dispose();
        _createInterstitialAd();
      });
      _interstitialAd!.show();
      _interstitialAd = null;
    }
  }

  void _createInterstitialAd() {
    InterstitialAd.load(
        adUnitId: AdMobServices.interstitialAdUnitId!,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) => _interstitialAd = ad,
          onAdFailedToLoad: (LoadAdError error) => _interstitialAd = null,
        ));
    print("interstitial addd");
  }

  @override
  void initState() {
    super.initState();
    initializeUser();

    //Internet connectivity checker
    InternetConnectionChecker().onStatusChange.listen((status) {
      final connected = status == InternetConnectionStatus.connected;
      // showSimpleNotification(connected?Text("Connected To Internet"):Text("No Internet Connected"));
      // utils.flushBarErrorMessage(
      //     connected ? "Connected To Internet" : "No Internet Connection",
      //     context);
      if (connected == false) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const no_internetConnection(),
          ),
        );
      }
    });

    _scrollViewController.addListener(() {
      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _showAppbar = false;
          setState(() {});
        }
      }

      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _showAppbar = true;
          setState(() {});
        }
      }
    });
    // _createBannerAd();
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

  Future<void> initializeUser() async {
    await Provider.of<UserDetailsProvider>(context, listen: false)
        .getUserLocally();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    UserModel? user =
        Provider.of<UserDetailsProvider>(context, listen: false).userDetails;

    return SafeArea(
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
          appBar: AppBar(
            toolbarHeight: 160,
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: false,
            automaticallyImplyLeading: false,
            title: Column(
              children: [
                Container(
                  width: 397.w,
                  // width: 450.w,
                  height: 190.h,
                  child: Stack(
                    children: [
                      Container(
                        width: 397.w,
                        // width: 450.w,
                        height: 145.h,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(242, 246, 255, 1),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(35.r),
                              topRight: Radius.circular(35.r)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                         
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 14.w, right: 15.w, top: 26.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        user!.name!.split(" ")[0] ?? "No name ",
                                        style: TextStyle(
                                            color: Color(0xff000000),
                                            fontSize: 35.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        'Welcome back, Ready to Rent?',
                                        style: TextStyle(
                                            color: Color(0xff000000),
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w300),
                                      )
                                    ],
                                  ),
                                  // ClipOval(
                                  //   child: CachedNetworkImage(
                                  //     imageUrl: user.profileImage!,
                                  //     width: 61.0,
                                  //     height: 61.0,
                                  //   ),
                                  // ),

                                  profilePic(
                                    url: user.profileImage,
                                    height: 61.h,
                                    width: 61.h,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 30.w,
                        top: 140.h,
                        child: Container(
                          height: 42.h,
                          width: 339.w,
                          // decoration: BoxDecoration(
                          // color: Color(0xffFFFFFF),
                          // borderRadius: BorderRadius.circular(7.r),
                          // boxShadow: [
                          //   BoxShadow(
                          //     spreadRadius: 1,
                          //     blurRadius: 1,
                          //     color: Colors.grey.withOpacity(0.3),
                          //   ),
                          // ]),
                          child:
                              search_bar(isReadOnly: true, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 13.h,
                ),
                AnimatedContainer(
                    duration: Duration(milliseconds: 700),
                    height: _showAppbar ? 150 : 0,
                    child: banner()),
                SizedBox(
                  height: 25.h,
                ),
                // Row(
                //   children: [
                //     shimmer_hostel_container(),
                //     shimmer_hostel_container(),
                //   ],
                // ),
                // Row(
                //   children: [
                //     shimmer_hostel_container(),
                //     shimmer_hostel_container(),
                //   ],
                // )

                FutureBuilder(
                  builder: (ctx, AsyncSnapshot<List<hostelModel>> snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        height: MediaQuery.of(context).size.height,
                        child: GridView.builder(
                          controller: _scrollViewController,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AdPage(
                                                hostel: snapshot.data![index])),
                                      );
                                    },
                                    child: HostelContainer(
                                      hostel: snapshot.data![index],
                                    )),
                              ],
                            );
                          },
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return no_internetConnection();
                    }
                    // Displaying LoadingSpinner to indicate waiting state
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return shimmer_hostel_container();
                        },
                      ),
                    );
                  },

                  // Future that needs to be resolved
                  // inorder to display something on the Canvas
                  future: FirebaseMethods.getHostelsData(),
                ),
                // FutureBuilder(
                //   builder: (ctx, AsyncSnapshot<List<hostelModel>> snapshot) {
                //     if (snapshot.connectionState == ConnectionState.done) {
                //       if (snapshot.hasError) {
                //         return no_internetConnection();
                //         // if we got our data
                //       } else if (snapshot.hasData) {
                //         // Extracting data from snapshot object
                //         //final data = snapshot.data as String;
                //         return Container(
                //           height: MediaQuery.of(context).size.height,
                //           child: GridView.builder(
                //             controller: _scrollViewController,
                //             itemCount: snapshot.data!.length,
                //             itemBuilder: (context, index) {
                //               return Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 mainAxisAlignment: MainAxisAlignment.start,
                //                 children: [
                //                   InkWell(
                //                       onTap: () {
                //                         Navigator.push(
                //                           context,
                //                           MaterialPageRoute(
                //                               builder: (context) => AdPage(
                //                                   hostel: snapshot.data![index])),
                //                         );
                //                       },
                //                       child: HostelContainer(
                //                         hostel: snapshot.data![index],
                //                       )),
                //                 ],
                //               );
                //             },
                //             gridDelegate:
                //                 SliverGridDelegateWithFixedCrossAxisCount(
                //               crossAxisCount: 2,
                //               mainAxisSpacing: 10,
                //               crossAxisSpacing: 10,
                //             ),
                //           ),
                //         );
                //       }
                //     }

                //     // Displaying LoadingSpinner to indicate waiting state
                //     return Center(
                //       child: Column(
                //         children: [
                //           Row(
                //             children: [
                //               shimmer_hostel_container(),
                //               shimmer_hostel_container(),
                //             ],
                //           ),
                //           Row(
                //             children: [
                //               shimmer_hostel_container(),
                //               shimmer_hostel_container(),
                //             ],
                //           )
                //         ],
                //       ),
                //     );
                //   },

                //   // Future that needs to be resolved
                //   // inorder to display something on the Canvas
                //   future: FirebaseMethods.getHostelsData(),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
