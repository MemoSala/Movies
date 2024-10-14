// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../bridge.dart';
import '../../../controller/bridge_controller.dart';
import '../../widget/responsive.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    return Container(
      alignment: AlignmentDirectional.center,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: (Responsive.isMobileLarge(context)) ? 250 : 220 * 3,
        height: heightScreen,
        margin: const EdgeInsets.symmetric(vertical: 10),
        constraints: BoxConstraints(
          maxHeight: (Responsive.isMobileLarge(context)) ? 530 : 250,
          minHeight: 0,
        ),
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 30, 30, 30),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [BoxShadow(offset: Offset(0, 0), blurRadius: 10)],
        ),
        child: Column(children: [
          GestureDetector(
            onTap: () {
              Bridge.sing();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              color: const Color.fromARGB(1, 0, 0, 0),
              child: const Row(
                children: [
                  Icon(
                    Icons.account_circle,
                    color: Colors.white,
                    size: 30,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Your Accont",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ber(),
          (Responsive.isMobileLarge(context))
              ? AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  height: heightScreen - 101,
                  constraints: const BoxConstraints(
                    maxHeight: 530 - 81,
                    minHeight: 0,
                  ),
                  child: ListView(
                    padding: const EdgeInsets.all(0),
                    children: [
                      tap1(context),
                      ber(),
                      tap2(context),
                      ber(),
                      tap3(context)
                    ],
                  ),
                )
              : Row(children: [tap1(context), tap2(context), tap3(context)]),
        ]),
      ),
    );
  }

  final double tapWidth = 210;
  SizedBox tap1(BuildContext context) {
    return SizedBox(
      width: tapWidth,
      child: Column(
        children: [
          drawerButton(
            icon: Icons.arrow_back_ios_new_rounded,
            text: "Back",
            onPressed: () => Navigator.of(context).pop(),
          ),
          drawerButton(
            icon: Icons.home,
            text: "Home",
            onPressed: () => Bridge.home(),
          ),
          drawerButton(
            icon: Icons.filter_list_rounded,
            text: "Top Vedio",
            onPressed: () {
              Bridge.allVedio(x);
            },
          ),
          drawerButton(
            icon: Icons.star_rounded,
            text: "My List",
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  SizedBox tap2(context) {
    return SizedBox(
      width: tapWidth,
      child: Column(
        children: [
          drawerButton(
            icon: Icons.view_list_rounded,
            text: "Movie",
            onPressed: () {
              Bridge.allVedio(
                  x.where((element) => element.type == "Movie").toList());
            },
          ),
          drawerButton(
            icon: Icons.view_list_rounded,
            text: "Series",
            onPressed: () {
              Bridge.allVedio(
                  x.where((element) => element.type == "Series").toList());
            },
          ),
          drawerButton(
            icon: Icons.view_list_rounded,
            text: "Anime Movie",
            onPressed: () {
              Bridge.allVedio(
                x.where((element) => element.type == 'anime movie').toList(),
              );
            },
          ),
          drawerButton(
            icon: Icons.view_list_rounded,
            text: "Anime",
            onPressed: () {
              Bridge.allVedio(
                  x.where((element) => element.type == "Anime").toList());
            },
          ),
        ],
      ),
    );
  }

  SizedBox tap3(context) {
    return SizedBox(
      width: tapWidth,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 4, bottom: 4, left: 10),
            alignment: AlignmentDirectional.topStart,
            child: const Text(
              "Follow us!",
              style: TextStyle(color: Colors.white60, fontSize: 17),
            ),
          ),
          drawerButton(
            icon: Icons.facebook,
            text: "Facebook",
            onPressed: () {},
          ),
          drawerButton(
            icon: FontAwesomeIcons.twitter,
            text: "Twitter",
            onPressed: () {},
          ),
          drawerButton(
            icon: FontAwesomeIcons.discord,
            text: "Discord",
            sizeIcon: 20,
            onPressed: () {},
          ),
          drawerButton(
            icon: FontAwesomeIcons.instagram,
            text: "Instagram",
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Container ber() {
    return Container(
      color: const Color.fromARGB(31, 212, 143, 143),
      height: 1,
      margin: const EdgeInsets.only(top: 5, bottom: 5),
    );
  }

  GestureDetector drawerButton({
    required IconData icon,
    String text = "",
    void Function()? onPressed,
    bool w500 = false,
    double sizeIcon = 25,
  }) {
    Color color = Colors.white60;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.only(top: 4, bottom: 4, left: 10),
        color: const Color.fromARGB(1, 0, 0, 0),
        child: Row(
          children: [
            Icon(icon, color: color, size: sizeIcon),
            SizedBox(width: 30 - sizeIcon),
            Text(text, style: TextStyle(color: color)),
          ],
        ),
      ),
    );
  }
}
