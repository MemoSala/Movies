import 'package:flutter/material.dart';

import 'move_home_part1.dart';

class HomePart1 extends StatelessWidget {
  const HomePart1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(children: [
      Expanded(flex: 2, child: MovieHomePart1()),
    ]);
  }
}
