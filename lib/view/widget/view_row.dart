// ignore_for_file: file_names, depend_on_referenced_packages, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'responsive.dart';

class ViewRow extends StatefulWidget {
  ViewRow({
    super.key,
    required this.titel,
    required this.child,
    this.keyS,
    this.titelColor,
    this.heightButten,
  });
  final String titel;
  final Widget child;
  bool? keyS;
  Color? titelColor;
  double? heightButten;
  @override
  State<ViewRow> createState() => _ViewRowState();
}

class _ViewRowState extends State<ViewRow> {
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
      /*
      if (mavingHomePart2.offset < 400) {
        showbtn2 = true;
        setState(() {});
      } else {
        showbtn2 = false;
        setState(() {});
      }
      */
    });

    super.initState();
  }

  void _incrementExit(PointerEvent details, int x) {
    setState(() {
      textColor[x] = Colors.white;
    });
  }

  void _updateLocation(PointerEvent details, int x) {
    setState(() {
      textColor[x] = const Color.fromARGB(255, 255, 208, 0);
    });
  }

  @override
  Column build(BuildContext context) {
    widget.keyS ??= false;
    widget.titelColor ??= Colors.white;
    widget.heightButten ??= 200;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      MouseRegion(
        onEnter: (event) => _updateLocation(event, 0),
        onExit: (event) => _incrementExit(event, 0),
        child: Row(children: [
          const Text(
            "  | ",
            style: TextStyle(
              color: Colors.amber,
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            widget.titel,
            style: TextStyle(
              color: widget.titelColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (widget.keyS!)
            Text(
              " >",
              style: TextStyle(
                color: textColor[0],
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
        ]),
      ),
      if (widget.keyS!)
        Text(
          "     ${AppLocalizations.of(context)!.hp2} ${widget.titel}",
          style: const TextStyle(color: Colors.grey),
        ),
      const SizedBox(height: 10),
      Stack(
        children: [
          SingleChildScrollView(
            reverse: false,
            controller: mavingHomePart2,
            scrollDirection: Axis.horizontal,
            child: widget.child,
          ),
          // Butten Moving
          if (!Responsive.isAndroid(context))
            Column(
              children: [
                SizedBox(height: widget.heightButten),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    butten(
                      Icons.navigate_before,
                      () {
                        run -= MediaQuery.of(context).size.width - 200;
                        mavingHomePart2.animateTo(
                          run,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.fastOutSlowIn,
                        );
                        run = mavingHomePart2.offset;
                      },
                      showbtn1,
                      widget.titelColor,
                    ),
                    butten(
                      Icons.navigate_next,
                      () {
                        run += MediaQuery.of(context).size.width - 200;
                        mavingHomePart2.animateTo(
                          run,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.fastOutSlowIn,
                        );
                        run = mavingHomePart2.offset;
                      },
                      showbtn2,
                      widget.titelColor,
                    ),
                  ],
                ),
              ],
            )
        ],
      ),
    ]);
  }

  AnimatedOpacity butten(icon, on, showbtn, titelColor) {
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
            side: BorderSide(width: 3.0, color: titelColor),
          )),
          overlayColor: const WidgetStatePropertyAll(Colors.black12),
        ),
        child: Icon(
          icon,
          size: 60,
          color: titelColor,
        ),
      ),
    );
  }
}
