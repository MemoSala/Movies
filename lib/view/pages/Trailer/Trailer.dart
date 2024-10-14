// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../home/home_appbar.dart';
import '../../widget/responsive.dart';
import '../../../controller/bridge_controller.dart';
import '../home/home_drawer.dart';
import 'Trailer Part 1.dart';
import 'Trailer Part 2.dart';
import 'Trailer Part 3.dart';

class Trailer extends StatelessWidget {
  const Trailer({super.key});

  @override
  Widget build(BuildContext context) {
    final Map xTrailer = ModalRoute.of(context)?.settings.arguments as Map;
    final Map xLive = xTrailer["xLive"];
    final int trailerNum = xTrailer["trailerNum"];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const HomeAppBar(),
        backgroundColor: Colors.white10,
      ),
      drawer: const HomeDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: (Responsive.isDesktop(context)) ? 15.0 : 0),
        child: ListView(
          children: [
            TrailerPart1(
              xLive: xLive,
              trailerNum: trailerNum,
            ),
            if (!Responsive.isDesktop(context)) TrailerPart2(xLive: xLive),
            if (xLive["Trailer"].length > 1)
              TrailerPart3(
                xLive: xLive,
                nameList: AppLocalizations.of(context)!.trailer,
                trailerNum: trailerNum,
              ),
            TrailerPart3(
              xLive: x
                  .where((element) =>
                      element.type == xLive["Type"] &&
                      element.name != xLive["name"])
                  .toList(),
              nameList: AppLocalizations.of(context)!.related,
              trailerNum: trailerNum,
            ),
          ],
        ),
      ),
    );
  }
}
