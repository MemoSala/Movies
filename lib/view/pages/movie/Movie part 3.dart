// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../widget/responsive.dart';
import '../../../l10n/l10n.dart';

class MoviePart3 extends StatelessWidget {
  const MoviePart3({super.key, required this.xLive});
  final Map xLive;

  @override
  Widget build(BuildContext context) {
    List<Widget> listRow = [];
    listRow.add(Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: textButton("${xLive["Type"]}"),
    ));
    for (var e1 in xLive["category"]) {
      listRow.add(Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: textButton("${e1[L10n.typeLanguageVoid(context)]}"),
      ));
    }
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 20 < 1100)
          ? (MediaQuery.of(context).size.width - 20)
          : 1110,
      child: Column(
        children: [
          if (Responsive.isTablet(context) && !Responsive.isMobile(context))
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  listAtea(
                    context,
                    "${xLive["Trailer"].length} VIDEOS",
                    Icons.video_collection,
                  ),
                  const SizedBox(height: 5),
                  listAtea(
                    context,
                    "${xLive["img"].length} PHOTOS",
                    Icons.photo_library,
                  ),
                ],
              ),
            ),
          if (Responsive.isTablet(context) && !Responsive.isMobile(context))
            const SizedBox(height: 10),
          Row(children: listRow),
          const SizedBox(height: 10),
          Text(
            xLive["story"][L10n.storyLanguageVoid(context, xLive)],
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  TextButton textButton(text) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        ),
        side: const WidgetStatePropertyAll<BorderSide>(
          BorderSide(color: Colors.white),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(text, style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  Container listAtea(context, text, icon) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width / 2 - 20,
      decoration: const BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(5)),
      ),
      child: TextButton(
        onPressed: () {},
        style: const ButtonStyle(
          overlayColor: WidgetStatePropertyAll(Colors.white10),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(icon, color: Colors.white, size: 20),
          const SizedBox(width: 5),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )
        ]),
      ),
    );
  }
}
