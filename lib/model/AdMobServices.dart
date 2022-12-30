import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

//  ios app id ca-app-pub-8480938527766664~1216477812
class AdMobServices {
  static String? get bannerAdUnitId {
    if (Platform.isAndroid) {
      print("platfrom is android");
      return 'ca-app-pub-8480938527766664/1930546267';
      // return 'ca-app-pub-3940256099942544/6300978111'; //test ad
      // return 'ca-app-pub-8480938527766664/7781762452'; //another bannerad
    } else if (Platform.isIOS) {
      return 'ca-app-pub-8480938527766664/3644519975';
    }
    return null;
  }

  static String? get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-8480938527766664/3196963262';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-8480938527766664/1102117112';
    }
    return null;
  }

  static final BannerAdListener bannerAdListener = BannerAdListener(
    onAdLoaded: (ad) => debugPrint("ad loaded"),
    onAdFailedToLoad: (ad, error) {
      print(error.message);
      ad.dispose();

      debugPrint('ad failed to laod$error');
    },
    onAdOpened: (ad) => debugPrint("ad opened"),
    onAdClosed: (ad) => debugPrint("ad closed"),
  );
}
