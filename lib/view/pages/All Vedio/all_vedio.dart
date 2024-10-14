import 'package:flutter/material.dart';

import '../../../bridge.dart';
import '../../widget/box_xlive.dart';
import '../home/home_appbar.dart';
import '../home/home_drawer.dart';

class AllVedio extends StatelessWidget {
  const AllVedio({super.key});

  @override
  Widget build(BuildContext context) {
    final List<MovieModel> xLives =
        ModalRoute.of(context)?.settings.arguments as List<MovieModel>;
    xLives.sort(
        (MovieModel a, MovieModel b) => b.evaluation.compareTo(a.evaluation));
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const HomeAppBar(),
        backgroundColor: Colors.white10,
      ),
      drawer: const HomeDrawer(),
      body: GridView(
        padding: const EdgeInsets.all(1),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          mainAxisExtent: 470,
        ),
        children: [
          for (MovieModel xlive in xLives)
            Container(
              alignment: AlignmentDirectional.center,
              child: BoxXlive(xlive: xlive),
            ),
        ],
      ),
    );
  }
}
