import 'package:flutter/material.dart';

import '../../widget/responsive.dart';
import '../home/home_appbar.dart';
import '../home/home_drawer.dart';
import 'Movie Part 1.dart';
import 'Movie Part 2.dart';
import 'Movie part 3.dart';
import 'Movie Part 4.dart';
import 'Movie Part 6.dart';

class Movie extends StatelessWidget {
  const Movie({super.key});

  @override
  Widget build(BuildContext context) {
    final Map xTrailer = ModalRoute.of(context)?.settings.arguments as Map;
    final Map xLive = xTrailer["xLive"];
    late double size;
    if (Responsive.isTablet(context)) {
      size = MediaQuery.of(context).size.width / (1400 - 272.5);
    } else if (MediaQuery.of(context).size.width < 1150) {
      size = MediaQuery.of(context).size.width / 1400;
    } else {
      size = 11.5 / 14;
    }
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const HomeAppBar(),
        backgroundColor: Colors.white10,
      ),
      drawer: const HomeDrawer(),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(height: 15),
          MoviePart1(xLive: xLive, size: size),
          const SizedBox(height: 15),
          MoviePart2(size: size, xLive: xLive),
          const SizedBox(height: 15),
          MoviePart3(xLive: xLive),
          const SizedBox(height: 5),
          if (Responsive.isMobileLarge(context))
            MoviePart4(size: size, xLive: xLive),
          MoviePart6(xLive: xLive),
        ]),
      ),
    );
  }
}
