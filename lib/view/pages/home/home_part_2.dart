import 'package:flutter/material.dart';
import 'package:movies/view/widget/view_row.dart';

import '../../../bridge.dart';
import '../../widget/box_xlive.dart';
import '../../../controller/bridge_controller.dart';

class HomePart2 extends StatelessWidget {
  const HomePart2({
    super.key,
    required this.nameFile,
    required this.nameList,
  });
  final String nameFile;
  final String nameList;

  @override
  Widget build(BuildContext context) {
    List<MovieModel> newx =
        x.where((element) => element.type == nameList).toList();

    return ViewRow(
      titel: nameFile,
      keyS: true,
      child: Row(
        children: List.generate(
          newx.length,
          (index) => BoxXlive(xlive: newx[index]),
        ),
      ),
    );
  }
}
