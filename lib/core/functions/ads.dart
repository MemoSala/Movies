import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../main.dart';

bool keyAds = true;
int adsNum = 0;
Future<void> ads({required Function ontap}) async {
  (adsNum == 0 && Platform.isAndroid)
      ? await InterstitialAd.load(
          adUnitId: (keyAds)
              ? 'ca-app-pub-3940256099942544/1033173712'
              : 'ca-app-pub-6881429067661382/5267988564',
          request: const AdRequest(),
          adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (ad) {
              interstitialAd = ad;
              interstitialAd.show();
              interstitialAd.fullScreenContentCallback =
                  FullScreenContentCallback(
                onAdDismissedFullScreenContent: (ad) {
                  ad.dispose();
                  interstitialAd.dispose();
                  ontap;
                },
                onAdFailedToShowFullScreenContent: ((ad, error) {
                  ad.dispose();
                  interstitialAd.dispose();
                }),
              );
            },
            onAdFailedToLoad: (error) {},
          ),
        )
      : ontap;
  adsNum++;
  if (adsNum > 8) adsNum = 0;
}

//Google ad
//ca-app-pub-6881429067661382~7481775288

//ad
//ca-app-pub-6881429067661382/1177039624