// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/functions/ads.dart';
import '../../../l10n/l10n.dart';
import '../../widget/responsive.dart';
import '../../../bridge.dart';

class TrailerPart2 extends StatelessWidget {
  const TrailerPart2({super.key, required this.xLive});
  final Map xLive;

  @override
  Widget build(BuildContext context) {
    var category = "${xLive["Type"]}, ";
    int typeLanguage = L10n.typeLanguageVoid(context);
    String storyLanguage = L10n.storyLanguageVoid(context, xLive);
    for (var element in xLive["category"]) {
      category += "${element[typeLanguage]}";
      if (xLive["category"][xLive["category"].length - 1] != element) {
        category += ", ";
      }
    }
    return Container(
      height: (Responsive.isDesktop(context)) ? 550 : null,
      color: Colors.white10,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 335 * 0.4,
                  width: 226 * 0.4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(xLive["img"][0]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: TextButton(
                    onPressed: () async =>
                        await ads(ontap: Bridge.movie(xLive)),
                    style: const ButtonStyle(
                      overlayColor: WidgetStatePropertyAll(Colors.black12),
                    ),
                    child: Container(),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: TextButton(
                    onPressed: () async =>
                        await ads(ontap: Bridge.movie(xLive)),
                    style: const ButtonStyle(
                      overlayColor: WidgetStatePropertyAll(
                        Color.fromARGB(0, 0, 0, 0),
                      ),
                    ),
                    child: SizedBox(
                      height: 133,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            child: Text(
                              "${xLive["name"]} (${xLive["time"].toDate().year})",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            child: Text(
                              category,
                              style: const TextStyle(
                                color: Colors.white54,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () => Bridge.movie(xLive),
                      icon: const Icon(
                        Icons.keyboard_arrow_right_rounded,
                        size: 28,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 70)
                  ],
                )
              ],
            ),
            const SizedBox(height: 10),
            const Divider(
              color: Colors.grey,
            ),
            const SizedBox(height: 5),
            Text(
              AppLocalizations.of(context)!.official,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            Text(xLive["story"][storyLanguage],
                style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
