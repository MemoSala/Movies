import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../../../../controller/bridge_controller.dart';
import '../../../../controller/home_controller.dart';

class ListHomePart1 extends GetView<HomeController> {
  const ListHomePart1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(height: 10),
      Text(
        AppLocalizations.of(context)!.hp1UpNext,
        style: const TextStyle(fontSize: 18, color: Colors.amber),
      ),
      const SizedBox(height: 10),
      Expanded(
        child: Container(
          color: Colors.grey.withOpacity(0.15),
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 5),
              Expanded(
                child: PageView.builder(
                  controller: controller.tapsController,
                  scrollDirection: Axis.vertical,
                  itemCount: x.length,
                  itemBuilder: (context, index) => CordHomePart1(index: index),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  AppLocalizations.of(context)!.hp1BT,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ]);
  }
}

class CordHomePart1 extends StatelessWidget {
  const CordHomePart1({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 19.5;
    return GetBuilder<HomeController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image.network(
            x[index].img[0],
            width: width,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.play_circle_outline,
                  size: 40,
                  color: Colors.white,
                ),
                Text(
                  x[index].name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
        ]),
      );
    });
  }
}
