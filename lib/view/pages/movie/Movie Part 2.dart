// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../bridge.dart';
import '../../../core/functions/ads.dart';
import '../youtube/youtube_thumbnail.dart';
import '../../widget/responsive.dart';

class MoviePart2 extends StatelessWidget {
  const MoviePart2({super.key, required this.size, required this.xLive});

  final double size;
  final Map xLive;

  @override
  Widget build(BuildContext context) {
    return (Responsive.isMobile(context))
        ? Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width * 9 / 16,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          YoutubeThumbnail(youtubeId: xLive["Trailer"][0]).hd(),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.width * 9 / 16 + 10,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(1),
                        ],
                        stops: const [0.6, 0.9],
                      ),
                    ),
                    child: TextButton(
                      onPressed: () => Bridge.trailer(xLive, 0),
                      style: const ButtonStyle(
                        overlayColor: WidgetStatePropertyAll(Colors.black12),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.play_circle_outline,
                            color: Colors.white,
                            size: 60,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 9 / 16 + 10,
                        width: 130,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.network(xLive["img"][0], width: 100),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              if (Responsive.isMobile(context))
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    smollListAtea(
                      context,
                      "${xLive["Trailer"].length} VIDEOS",
                      Icons.video_collection,
                    ),
                    const SizedBox(width: 5),
                    smollListAtea(
                      context,
                      "${xLive["img"].length} PHOTOS",
                      Icons.photo_library,
                    ),
                  ],
                ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 335 * (550 / 335) * size,
                width: 226 * (550 / 335) * size,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(xLive["img"][0]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Stack(
                children: [
                  SizedBox(
                    height: 550 * size,
                    width: 710 * size,
                    child: Image.network(
                      YoutubeThumbnail(youtubeId: xLive["Trailer"][0]).hd(),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  SizedBox(
                    height: 550 * size,
                    width: 710 * size,
                    child: TextButton(
                      onPressed: () async => await ads(
                        ontap: Bridge.trailer(xLive, 0),
                      ),
                      style: const ButtonStyle(
                        overlayColor: WidgetStatePropertyAll(Colors.black12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.play_circle_outline,
                                color: Colors.white,
                                size: 80 * size,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  AppLocalizations.of(context)!.trailer,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28 * size,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              if (!Responsive.isTablet(context)) const SizedBox(width: 5),
              if (!Responsive.isTablet(context))
                Column(
                  children: [
                    listAtea("${xLive["Trailer"].length} VIDEOS",
                        Icons.video_collection),
                    const SizedBox(height: 10),
                    listAtea(
                        "${xLive["img"].length} PHOTOS", Icons.photo_library),
                  ],
                ),
            ],
          );
  }

  Container listAtea(text, icon) {
    return Container(
      height: 272.5 * size,
      width: 272.5 * size,
      decoration: const BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.horizontal(right: Radius.circular(5)),
      ),
      child: TextButton(
        onPressed: () {},
        style: const ButtonStyle(
          overlayColor: WidgetStatePropertyAll(Colors.white10),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(icon, color: Colors.white, size: 70 * size),
          const SizedBox(height: 5),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25 * size,
              fontWeight: FontWeight.bold,
            ),
          )
        ]),
      ),
    );
  }

  Expanded smollListAtea(context, text, icon) {
    return Expanded(
      child: Container(
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
      ),
    );
  }
}
