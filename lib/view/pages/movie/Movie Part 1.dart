// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:movies/view/widget/responsive.dart';

import '../../../l10n/l10n.dart';
import '../../../controller/bridge_controller.dart';

class MoviePart1 extends StatelessWidget {
  const MoviePart1({super.key, required this.size, required this.xLive});

  final Map xLive;
  final double size;

  @override
  Widget build(BuildContext context) {
    int movieRanking = 1;
    for (var e1 in x) {
      if (xLive["Evaluation"] < e1.evaluation) {
        movieRanking++;
      }
    }
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 50 < 1100)
          ? (MediaQuery.of(context).size.width - 50)
          : 1100,
      child: Row(children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                xLive["name"],
                style: TextStyle(
                  color: Colors.white,
                  fontSize:
                      50 * size * ((20 + 80) / (xLive["name"].length + 80)),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "${xLive["time"].toDate().year} ${L10n.timeMonthVoid(context, xLive)} ${xLive["time"].toDate().day}",
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 20 * size,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        if (!Responsive.isMobileLarge(context))
          Expanded(
            child: solo(
              titel: "IMDb-BEWERTUNG",
              icon: Icons.star,
              colorIcon: Colors.amber,
              titelIcon: "${xLive["Evaluation"]}/10",
            ),
          ),
        if (!Responsive.isMobileLarge(context))
          Expanded(
            child: solo(
              titel: "IHRE BEWERTUNG",
              icon: Icons.star_border_rounded,
            ),
          ),
        if (!Responsive.isMobileLarge(context))
          Expanded(
            child: solo(
              titel: "movie ranking",
              icon: (movieRanking < x.length / 3)
                  ? Icons.keyboard_double_arrow_up_rounded
                  : (movieRanking > x.length * 2 / 3)
                      ? Icons.keyboard_double_arrow_down_rounded
                      : Icons.keyboard_control,
              colorIcon: (movieRanking < x.length / 3)
                  ? Colors.green
                  : (movieRanking > x.length * 2 / 3)
                      ? Colors.red
                      : Colors.yellow,
              titelIcon: "$movieRanking",
            ),
          ),
      ]),
    );
  }

  Column solo({
    required String titel,
    required IconData icon,
    MaterialColor? colorIcon,
    String? titelIcon,
    Widget? child,
    onPressed,
  }) {
    onPressed ??= () {};
    colorIcon ??= Colors.grey;
    titelIcon ??= "";
    child ??= const SizedBox();
    return Column(
      children: [
        Text(
          titel,
          style: TextStyle(
            color: Colors.white54,
            fontSize: 20 * size,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
        TextButton(
          onPressed: onPressed,
          style: const ButtonStyle(
            overlayColor: WidgetStatePropertyAll(Colors.white10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: colorIcon, size: 30),
              if (titelIcon != "") const SizedBox(width: 5),
              Text(
                titelIcon,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25 * size,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (child != const SizedBox()) const SizedBox(width: 5),
              child,
            ],
          ),
        ),
      ],
    );
  }
}
