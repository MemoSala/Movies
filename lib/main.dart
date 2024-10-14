import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import 'core/constant/app_route.dart';
import 'l10n/l10n.dart';
import 'routes.dart';

late InterstitialAd interstitialAd;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyACkJacqcO0nR2zDdD8t9zTEJVw97Wcg2A",
          authDomain: "movies-a1923.firebaseapp.com",
          projectId: "movies-a1923",
          storageBucket: "movies-a1923.appspot.com",
          messagingSenderId: "395336350259",
          appId: "1:395336350259:web:069e48ea9f8e3533840146"),
    );
  } catch (e) {
    print("Error Firebase Init: $e");
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Movies',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(),
      initialRoute: AppRoute.bridge,
      supportedLocales: L10n.all,
      getPages: routes,
    );
  }
}