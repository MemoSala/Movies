import 'dart:io';

import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive({
    super.key,
    required this.desktop,
    this.tablet,
    this.mobileLarge,
    required this.mobile,
  });

  final Widget desktop;
  final Widget? tablet;
  final Widget? mobileLarge;
  final Widget mobile;

  static bool isDesktop(context) {
    return MediaQuery.of(context).size.width >= 1024;
  }

  static bool isTablet(context) {
    return MediaQuery.of(context).size.width < 1024;
  }

  static bool isMobileLarge(context) {
    return MediaQuery.of(context).size.width <= 700;
  }

  static bool isMobile(context) {
    return MediaQuery.of(context).size.width <= 500;
  }

  static bool isAndroid(context) {
    try {
      return Platform.isAndroid;
    } catch (e) {
      return isMobile(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (size.width >= 1024) {
      return desktop;
    } else if (size.width >= 700 && tablet != null) {
      return tablet!;
    } else if (size.width >= 450 && mobileLarge != null) {
      return mobileLarge!;
    } else {
      return mobile;
    }
  }
}
