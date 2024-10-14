// ignore_for_file: depend_on_referenced_packages, file_names, dead_code
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../widget/responsive.dart';
import 'Trailer Part 2.dart';

class TrailerPart1 extends StatelessWidget {
  const TrailerPart1(
      {super.key, required this.xLive, required this.trailerNum});
  final Map xLive;
  final int trailerNum;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: SizedBox(
            height: (Responsive.isDesktop(context))
                ? 550
                : 230 * (MediaQuery.of(context).size.width / 400),
            child: YoutubeAppDemo(id: xLive["Trailer"][trailerNum]),
          ),
        ),
        if (Responsive.isDesktop(context))
          Expanded(
            flex: 1,
            child: TrailerPart2(xLive: xLive),
          ),
      ],
    );
  }
}

//------------------------------------------------------------------------------

class YoutubeAppDemo extends StatefulWidget {
  const YoutubeAppDemo({super.key, required this.id});
  final String id;
  @override
  State<YoutubeAppDemo> createState() => _YoutubeAppDemoState();
}

class _YoutubeAppDemoState extends State<YoutubeAppDemo> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController.fromVideoId(
      videoId: widget.id,
      autoPlay: false,
      params: const YoutubePlayerParams(showFullscreenButton: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerScaffold(
      controller: _controller,
      builder: (context, player) {
        return player;
      },
    );
  }
}
