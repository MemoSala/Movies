import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

bool yKey = false;

class HomeController extends GetxController {
  PageController pageController = PageController();
  PageController tapsController = PageController(
    viewportFraction: 1 / 3,
    initialPage: 2,
  );
  final int maxList = 9;
  int indexTap = 0;

  bool yKeyR = true;

  @override
  void onInit() {
    super.onInit();

    Timer.periodic(const Duration(seconds: 8), (timer) {
      try {
        if (yKeyR) nextTap();
      } catch (e) {
        null;
      }
    });
  }

  void toPage(int i) {
    pageController.animateToPage(
      i,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
    tapsController.animateToPage(
      i + 2,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
    update();
  }

  void nextTap() {
    (indexTap != maxList - 1) ? indexTap++ : indexTap = 0;
    yKey = false;
    toPage(indexTap % maxList);
  }

  void backTap() {
    (indexTap != 0) ? indexTap-- : indexTap = maxList - 1;
    yKey = true;
    yKeyR = false;
    toPage(indexTap % maxList);
  }
}
