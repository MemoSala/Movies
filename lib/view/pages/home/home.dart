// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller.dart';
import '../../widget/home/home_part_1.dart';
import 'home_appbar.dart';
import 'home_part_2.dart';
import 'home_drawer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // HomeController controller =
    Get.put(HomeController());
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const HomeAppBar(),
        backgroundColor: Colors.white10,
      ),
      drawer: const HomeDrawer(),
      body: ListView(children: [
        const HomePart1(),
        const SizedBox(height: 30),
        HomePart2(
          nameFile: AppLocalizations.of(context)!.hMovie,
          nameList: 'Movie',
        ), //Movie
        HomePart2(
          nameFile: AppLocalizations.of(context)!.hSeries,
          nameList: 'Series',
        ), //Series
        HomePart2(
          nameFile: AppLocalizations.of(context)!.hAnimeMovie,
          nameList: 'anime movie',
        ), //anime movie
        HomePart2(
          nameFile: AppLocalizations.of(context)!.hAnime,
          nameList: 'Anime',
        ), //Anime
      ]),
    );
  }
}
