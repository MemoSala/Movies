import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/bridge_controller.dart';
import '../../../controller/home_controller.dart';
import '../responsive.dart';
import '../../../bridge.dart';
import '../../pages/youtube/youtube_thumbnail.dart';

class MovieHomePart1 extends GetView<HomeController> {
  const MovieHomePart1({super.key});

  @override
  Widget build(BuildContext context) {
    double qSize = (Responsive.isDesktop(context))
        ? MediaQuery.of(context).size.width * 2 / 3
        : MediaQuery.of(context).size.width;
    return SizedBox(
      height: qSize * 9 / 16,
      child: Stack(children: [
        PageView.builder(
          controller: controller.pageController,
          itemCount: x.length,
          itemBuilder: (context, index) => boxMovie(
            img0: YoutubeThumbnail(youtubeId: x[index].trailer[0]).hd(),
            xLive: x[index],
            size: qSize / 850,
            name: x[index].name,
            img1: x[index].img[0],
          ),
        ),
      ]),
    );
  }

  Stack boxMovie(
      {required String img0,
      required MovieModel xLive,
      required double size,
      required String name,
      required String img1}) {
    return Stack(
      children: [
        Image.network(img0, fit: BoxFit.fitWidth),
        Container(
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
        ),
        Container(
          width: size * 850,
          height: size * 850 * 9 / 16,
          color: Colors.transparent,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: GetPlatform.isMobile
                ? [
                    Row(
                      children: [
                        SizedBox(width: 200 * size),
                        Icon(
                          Icons.play_circle_outline,
                          size: 80 * (size + 0.25),
                          color: Colors.white,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 60,
                      child: Row(
                        children: [
                          SizedBox(width: 210 * size),
                          Expanded(
                            child: Text(
                              name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30 * size,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]
                : [
                    Row(
                      children: [
                        SizedBox(width: 190 * size),
                        const Icon(
                          Icons.play_circle_outline,
                          size: 80,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30 * size,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                height: 335 * 0.75 * size,
                width: 226 * 0.75 * size,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(img1),
                    fit: BoxFit.cover,
                  ),
                ),
                child: TextButton(
                  onPressed: () => Bridge.movie(xLive),
                  style: const ButtonStyle(
                    overlayColor: WidgetStatePropertyAll(Colors.black12),
                  ),
                  child: Container(),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  TextButton goState(icon, index, on) {
    return TextButton(
      onPressed: on,
      style: ButtonStyle(
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(vertical: 15),
        ),
        shape: WidgetStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side: const BorderSide(width: 3.0, color: Colors.white),
        )),
        overlayColor: const WidgetStatePropertyAll(Colors.black12),
      ),
      child: Icon(
        icon,
        size: 60,
        color: Colors.white,
      ),
    );
  }
}
