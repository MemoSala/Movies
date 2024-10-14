// ignore_for_file: file_names, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies/view/pages/Trailer/Trailer%20Part%203.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../widget/view_row.dart';
import '../../../bridge.dart';
import '../../../controller/bridge_controller.dart';
import '../../widget/responsive.dart';

class MoviePart6 extends StatefulWidget {
  const MoviePart6({super.key, required this.xLive});
  final Map xLive;

  @override
  State<MoviePart6> createState() => _MoviePart6State();
}

class _MoviePart6State extends State<MoviePart6> {
  final int trailerNum = -1;
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

  oooFor(oo2, snapshot, w) async {
    oo2.addAll(await snapshot.data!.docChanges.first.doc.reference
        .collection(w)
        .get()
        .then((value) => value.docs.where((element) {
              late bool keyElement;
              for (String e1 in widget.xLive["cast"]) {
                keyElement = element["id"] == e1;
                if (keyElement) break;
              }
              return keyElement;
            })));
  }

  List listOo2 = [
    'A',
    'B',
    'C',
    'D',
    'F',
    'E',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];
  int numListOo2 = 0;
  @override
  Widget build(BuildContext context) {
    List<MovieModel> newx = x
        .where((element) => (element.type == widget.xLive["Type"] &&
            element.name != widget.xLive["name"]))
        .toList();
    double size = (Responsive.isDesktop(context))
        ? 0.75
        : (Responsive.isMobileLarge(context)
            ? 0.5
            : 0.75 * (MediaQuery.of(context).size.width / 1100));

    List<Widget> allw = [];

    for (var onew in listOo2) {
      allw.add(StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("cast")
            .doc("5Wb4xFMsbERRzwZqgunk")
            .collection(onew)
            .snapshots(),
        builder: (context, snapshot) {
          List allx = [];
          try {
            allx.addAll(snapshot.data!.docs.where((element) {
              bool keyElement = false;
              for (String e1 in widget.xLive["cast"]) {
                keyElement = element["id"] == e1;
                if (keyElement) break;
              }
              return keyElement;
            }));
          } catch (e) {
            null;
          }

          List<Widget> cast = [];
          for (var onex in allx) {
            if (numListOo2 < 99) {
              cast.add(
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(children: [
                    CircleAvatar(
                      radius: 70.0,
                      backgroundImage: NetworkImage(onex['img']),
                    ),
                    const SizedBox(height: 3),
                    SizedBox(
                        width: 140,
                        child: Text(
                          onex['name'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ]),
                ),
              );
            }
            numListOo2++;
          }
          return Row(
            children: cast,
          );
        },
      ));
    }

    return Container(
      color: Colors.white,
      child: Row(children: [
        Expanded(
          flex: 2,
          child: Column(children: [
            const SizedBox(height: 15),
            TrailerPart3(
              xLive: widget.xLive,
              nameList: "no name",
              trailerNum: trailerNum,
              colorTitle: Colors.black,
            ),
            const SizedBox(height: 30),
            ViewRow(
              heightButten: 80,
              titel: "no name",
              titelColor: Colors.black,
              child: Row(
                children: List.generate(
                  widget.xLive["img"].length,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Image.network(
                        widget.xLive["img"][index],
                        height: 335 * size,
                      ),
                    );
                  },
                ),
              ),
            ),
            if (widget.xLive["cast"].isNotEmpty) const SizedBox(height: 30),
            if (widget.xLive["cast"].isNotEmpty)
              ViewRow(
                heightButten: 50,
                titel: "Top cast",
                titelColor: Colors.black,
                child: Row(
                  children: allw,
                ),
              ),
            const SizedBox(height: 30),
            ViewRow(
              titel: AppLocalizations.of(context)!.related,
              titelColor: Colors.black,
              child: Row(
                children: List.generate(
                  newx.length,
                  (index) => Padding(
                    padding:
                        const EdgeInsets.only(right: 10, bottom: 30, left: 10),
                    child: Container(
                      width: 226 * 0.75,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 225, 225, 225),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 335 * 0.75,
                            width: 226 * 0.75,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(newx[index].img[0]),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: TextButton(
                              onPressed: () => Bridge.movie(newx[index]),
                              style: ButtonStyle(
                                overlayColor: WidgetStatePropertyAll(
                                  Colors.black.withOpacity(0.1),
                                ),
                              ),
                              child: const Center(),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(children: [
                            const SizedBox(width: 8),
                            const Icon(Icons.star,
                                color: Colors.amber, size: 16),
                            const SizedBox(width: 5),
                            Text(
                              "${newx[index].evaluation}",
                              style: const TextStyle(color: Colors.black),
                            ),
                          ]),
                          const SizedBox(height: 4),
                          SizedBox(
                            height: 70,
                            child: TextButton(
                              onPressed: () => Bridge.movie(newx[index]),
                              style: const ButtonStyle(
                                overlayColor: WidgetStatePropertyAll(
                                  Color.fromARGB(0, 50, 50, 50),
                                ),
                              ),
                              child: MouseRegion(
                                onEnter: (event) {
                                  setState(() {
                                    newx[index].fontWeight = FontWeight.bold;
                                  });
                                },
                                onExit: (event) {
                                  setState(() {
                                    newx[index].fontWeight = FontWeight.normal;
                                  });
                                },
                                child: SizedBox(
                                  height: 60,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      newx[index].name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: newx[index].fontWeight,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: SizedBox(
                              height: 30,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: const ButtonStyle(
                                  elevation: WidgetStatePropertyAll(0),
                                  backgroundColor: WidgetStatePropertyAll(
                                    Color.fromARGB(255, 175, 175, 175),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.add,
                                        color:
                                            Color.fromARGB(255, 22, 140, 223)),
                                    Text(
                                      AppLocalizations.of(context)!.watchlist,
                                      style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 22, 140, 223),
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 10),
                            child: SizedBox(
                              height: 30,
                              child: ElevatedButton(
                                onPressed: () => Bridge.trailer(newx[index], 0),
                                style: const ButtonStyle(
                                  elevation: WidgetStatePropertyAll(0),
                                  backgroundColor: WidgetStatePropertyAll(
                                    Color.fromARGB(255, 200, 200, 200),
                                  ),
                                  overlayColor: WidgetStatePropertyAll(
                                    Color.fromARGB(255, 175, 175, 175),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.play_arrow_rounded,
                                        color: Colors.black),
                                    Text(
                                      AppLocalizations.of(context)!.trailer,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ]),
        ),
        if (Responsive.isDesktop(context)) Expanded(child: Container()),
      ]),
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
            side: const BorderSide(width: 3.0, color: Colors.black),
          )),
          overlayColor: const WidgetStatePropertyAll(Colors.black12),
        ),
        child: Icon(
          icon,
          size: 60,
          color: Colors.black,
        ),
      ),
    );
  }
}
