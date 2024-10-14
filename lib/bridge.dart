// ignore_for_file: depend_on_referenced_packages, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import 'controller/bridge_controller.dart';
import 'core/constant/app_route.dart';
import 'view/widget/Error.dart';
import 'view/widget/List category.dart';
import 'view/pages/home/home.dart';

class Bridge extends StatelessWidget {
  const Bridge({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BridgeController());

    // return const Error0(
    //   errorIcon: Icons.wifi_off,
    //   errorName: "No Internet Connection.",
    // );
    return GetBuilder<BridgeController>(
      builder: (controller) {
        if ((controller.versionWap == "loding")) {
          return const Error0(
            errorIcon: Icons.more_horiz,
            errorName: "Loding",
          );
        } else if ((controller.versionApp == controller.versionWap)) {
          return StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("movies")
                .orderBy("time")
                .snapshots(),
            builder: (context, snapshot) {
              Iterable<QueryDocumentSnapshot<Object?>>? allx;
              allx = snapshot.data?.docs.reversed;
              if (allx != null) {
                x = [];
                for (QueryDocumentSnapshot<Object?> onex in allx) {
                  Map<String, dynamic> newOnex =
                      onex.data() as Map<String, dynamic>;
                  List<List<String>> type = [];
                  for (var element in onex["category Type"]) {
                    listCategory.forEach((key, value1) {
                      if (key == element[0]) {
                        value1.forEach((key, value2) {
                          if (key == element) type.add(value2);
                        });
                      }
                    });
                  }
                  x.add(MovieModel.json(newOnex, type));
                }
                return const Home();
              } else {
                return Container(color: Colors.black);
              }
            },
          );
        } else if ((controller.versionApp != controller.versionWap)) {
          return const Error0(
            errorIcon: Icons.error_outline_rounded,
            errorName:
                "The version is old, please update the application to the latest version.",
          );
        } else {
          return const Error0(
            errorIcon: Icons.error_outline_rounded,
            errorName: "Unknown error",
          );
        }
      },
    );
  }

  static trailer(xLive, newNXnum) {
    Get.offNamed(AppRoute.trailer, arguments: {
      "xLive": xLive,
      "trailerNum": 0,
      "newNXnum": newNXnum,
    });
  }

  static movie(xLive) {
    Get.toNamed(AppRoute.movie, arguments: {"xLive": xLive});
  }

  static home() {
    Get.offAllNamed(AppRoute.movie);
  }

  static allVedio(xLive) {
    Get.toNamed(AppRoute.vedios, arguments: xLive);
  }

  static sing() {
    Get.toNamed(AppRoute.sing);
  }
}

class MovieModel {
  final String _name;
  final List _img;
  final DateTime _time;
  final List<List<String>> _category;
  final String _type;
  final double _evaluation;
  final List _trailer;
  final Map<String, dynamic> _story;
  FontWeight fontWeight = FontWeight.normal;
  final List _cast;
  MovieModel(
      {required String name,
      required List img,
      required DateTime time,
      required List<List<String>> category,
      required String type,
      required double evaluation,
      required List trailer,
      required Map<String, dynamic> story,
      required List cast})
      : _name = name,
        _img = img,
        _time = time,
        _category = category,
        _type = type,
        _evaluation = evaluation,
        _trailer = trailer,
        _story = story,
        _cast = cast;

  MovieModel.json(Map date, List<List<String>> type)
      : _name = date["name"],
        _img = date["img"],
        _time = (date["time"] as Timestamp).toDate(),
        _category = type,
        _type = date["category"],
        _evaluation = (date["Evaluation"] as num).toDouble(),
        _trailer = date["Trailer"],
        _story = date["story"],
        _cast = date["cast"];

  String get name => _name;
  List get img => _img;
  DateTime get time => _time;
  List<List<String>> get category => _category;
  String get type => _type;
  double get evaluation => _evaluation;
  List get trailer => _trailer;
  Map<String, dynamic> get story => _story;
  List get cast => _cast;
}
