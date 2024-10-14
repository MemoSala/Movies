import 'package:flutter/material.dart';

import '../home/home_appbar.dart';
import '../home/home_drawer.dart';

class Sing extends StatelessWidget {
  const Sing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const HomeAppBar(),
        backgroundColor: Colors.white10,
      ),
      drawer: const HomeDrawer(),
    );
  }
}
