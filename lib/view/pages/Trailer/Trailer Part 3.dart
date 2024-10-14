// ignore_for_file: file_names, prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:movies/view/widget/view_row.dart';

import '../../../core/functions/ads.dart';
import '../../widget/responsive.dart';
import '../../../bridge.dart';
import '../youtube/youtube_thumbnail.dart';

class TrailerPart3 extends StatefulWidget {
  TrailerPart3({
    super.key,
    required this.xLive,
    required this.nameList,
    required this.trailerNum,
    this.colorTitle,
  });
  final xLive;
  final String nameList;
  final int trailerNum;
  Color? colorTitle;

  @override
  State<TrailerPart3> createState() => _TrailerPart3State();
}

class _TrailerPart3State extends State<TrailerPart3> {
  Color colorMouseRegion = Colors.white;

  ScrollController mavingHomePart2 = ScrollController();
  bool showbtn1 = false;
  bool showbtn2 = true;
  double run = 0;
  List<Color> textColor = [
    Colors.white, //0
  ];
  @override
  void initState() {
    mavingHomePart2.addListener(() {
      run = mavingHomePart2.offset;
      if (mavingHomePart2.offset > 10.0) {
        showbtn1 = true;
        setState(() {});
      } else {
        showbtn1 = false;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var newx = widget.xLive;
    widget.colorTitle ??= Colors.white;
    double size = (Responsive.isDesktop(context))
        ? 0.75
        : (Responsive.isMobileLarge(context)
            ? 0.5
            : 0.75 * (MediaQuery.of(context).size.width / 1100));
    return Container(
      color: (Responsive.isDesktop(context)) ? null : Colors.white10,
      child: ViewRow(
        heightButten: 80,
        titel: widget.nameList,
        titelColor: widget.colorTitle,
        child: Row(
          children: List.generate(
            (newx is List<Map<dynamic, dynamic>>)
                ? newx.length
                : newx["Trailer"].length,
            (index) {
              return newMethod(size, newx, index, context);
            },
          ),
        ),
      ),
    );
  }

  Widget newMethod(
    double size,
    newx,
    int index,
    BuildContext context,
  ) {
    String youtubeID = (newx is List<Map<dynamic, dynamic>>)
        ? newx[index]["Trailer"][0]
        : newx["Trailer"][index];
    var newNX = (newx is List<Map<dynamic, dynamic>>) ? newx[index] : newx;
    int newNXnum = (newx is List<Map<dynamic, dynamic>>) ? 0 : index;
    return (index == widget.trailerNum && newx is! List<Map<dynamic, dynamic>>)
        ? Container()
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: 335 * size * (16 / 9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 335 * size,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            YoutubeThumbnail(youtubeId: youtubeID).hq()),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: TextButton(
                      onPressed: () async => await ads(
                        ontap: Bridge.trailer(newNX, newNXnum),
                      ),
                      style: ButtonStyle(
                        overlayColor: WidgetStatePropertyAll(
                          Colors.black.withOpacity(0.1),
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MouseRegion(
                              onEnter: (event) {
                                setState(() {
                                  colorMouseRegion = Colors.amber;
                                });
                              },
                              onExit: (event) {
                                setState(() {
                                  colorMouseRegion = Colors.white;
                                });
                              },
                              child: Icon(
                                Icons.play_circle_outline,
                                color: colorMouseRegion,
                              ),
                            ),
                            const Center(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (newx is List<Map<dynamic, dynamic>>)
                    TextButton(
                      onPressed: () => Bridge.trailer(newx[index], 0),
                      style: const ButtonStyle(
                        overlayColor: WidgetStatePropertyAll(
                          Color.fromARGB(0, 50, 50, 50),
                        ),
                      ),
                      child: MouseRegion(
                        onEnter: (event) {
                          setState(() {
                            newx[index]["fontWeight"] = FontWeight.bold;
                          });
                        },
                        onExit: (event) {
                          setState(() {
                            newx[index]["fontWeight"] = FontWeight.normal;
                          });
                        },
                        child: SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              newx[index]["name"],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: widget.colorTitle,
                                fontSize: 18,
                                fontWeight: newx[index]["fontWeight"],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
  }

  AnimatedOpacity butten(icon, on, showbtn) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 1000),
      opacity: showbtn ? 1.0 : 0.0,
      child: TextButton(
        onPressed: on,
        style: ButtonStyle(
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(vertical: 15),
          ),
          shape: WidgetStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(width: 3.0, color: widget.colorTitle as Color),
          )),
          overlayColor: const WidgetStatePropertyAll(Colors.black12),
        ),
        child: Icon(
          icon,
          size: 60,
          color: widget.colorTitle,
        ),
      ),
    );
  }
}
