import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import '../bridge.dart';

List<MovieModel> x = [];

class BridgeController extends GetxController {
  String versionWap = "loding", versionApp = "1.2.0", resultName = "";
  @override
  void onInit() async {
    await versionFirebase();
    await connection();
    update();
    super.onInit();
  }

  Future<void> versionFirebase() async {
    await FirebaseFirestore.instance.collection("version").get().then(
          (value) => versionWap = value.docs[0].data()["version"],
        );
  }

  Future<void> connection() async {
    var result = await Connectivity().checkConnectivity();
    resultName = result.name;
  }
}
