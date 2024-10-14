import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../bridge.dart';

class BoxXlive extends StatefulWidget {
  const BoxXlive({
    super.key,
    required this.xlive,
  });

  final MovieModel xlive;

  @override
  State<BoxXlive> createState() => _BoxXliveState();
}

class _BoxXliveState extends State<BoxXlive> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, bottom: 30, left: 10),
      child: Container(
        width: 226 * 0.75,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 25, 25, 25),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 335 * 0.75,
              width: 226 * 0.75,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.xlive.img[0]),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.low,
                ),
              ),
              child: TextButton(
                onPressed: () => Bridge.movie(widget.xlive),
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
              const Icon(Icons.star, color: Colors.amber, size: 16),
              const SizedBox(width: 5),
              Text(
                "${widget.xlive.evaluation}",
                style: const TextStyle(color: Colors.white),
              ),
            ]),
            const SizedBox(height: 4),
            SizedBox(
              height: 70,
              child: TextButton(
                onPressed: () => Bridge.movie(widget.xlive),
                style: const ButtonStyle(
                  overlayColor: WidgetStatePropertyAll(
                    Color.fromARGB(0, 50, 50, 50),
                  ),
                ),
                child: MouseRegion(
                  onEnter: (event) {
                    setState(() {
                      widget.xlive.fontWeight = FontWeight.bold;
                    });
                  },
                  onExit: (event) {
                    setState(() {
                      widget.xlive.fontWeight = FontWeight.normal;
                    });
                  },
                  child: SizedBox(
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.xlive.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: widget.xlive.fontWeight,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                height: 30,
                child: ElevatedButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                    elevation: WidgetStatePropertyAll(0),
                    backgroundColor: WidgetStatePropertyAll(
                      Color.fromARGB(255, 50, 50, 50),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.add, color: Colors.blue),
                      Text(
                        AppLocalizations.of(context)!.watchlist,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
              child: SizedBox(
                height: 30,
                child: ElevatedButton(
                  onPressed: () => Bridge.trailer(widget.xlive, 0),
                  style: const ButtonStyle(
                    elevation: WidgetStatePropertyAll(0),
                    backgroundColor: WidgetStatePropertyAll(
                      Color.fromARGB(255, 25, 25, 25),
                    ),
                    overlayColor: WidgetStatePropertyAll(
                      Color.fromARGB(255, 50, 50, 50),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.play_arrow_rounded, color: Colors.white),
                      Text(
                        AppLocalizations.of(context)!.trailer,
                        style: const TextStyle(
                          color: Colors.white,
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
    );
  }
}
