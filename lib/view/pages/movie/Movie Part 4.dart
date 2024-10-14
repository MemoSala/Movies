// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../controller/bridge_controller.dart';

class MoviePart4 extends StatelessWidget {
  const MoviePart4({super.key, required this.size, required this.xLive});
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
    return Row(children: [
      Expanded(
        child: solo(
          titel: "IMDb-BEWERTUNG",
          icon: Icons.star,
          colorIcon: Colors.amber,
          titelIcon: "${xLive["Evaluation"]}/10",
        ),
      ),
      Expanded(
        child: solo(
          titel: "IHRE BEWERTUNG",
          icon: Icons.star_border_rounded,
        ),
      ),
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
    ]);
  }

  TextButton solo({
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
    return TextButton(
      onPressed: onPressed,
      style: const ButtonStyle(
        overlayColor: WidgetStatePropertyAll(Colors.white10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$titel: ",
            style: TextStyle(
              color: Colors.white54,
              fontSize: 22 * size,
              fontWeight: FontWeight.w500,
            ),
          ),
          Icon(icon, color: colorIcon, size: 30 * size),
          if (titelIcon != "") const SizedBox(width: 5),
          Text(
            titelIcon,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22 * size,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (child != const SizedBox()) const SizedBox(width: 5),
          child,
        ],
      ),
    );
  }
}
