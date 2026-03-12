import 'package:emmanuel_rhythms_app/models/video_type.dart';
import 'package:flutter/material.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class VideoWidget extends StatefulWidget {
  final String videoId;
  final VideoType videoType;

  const VideoWidget({Key? key, required this.videoId, required this.videoType})
      : super(key: key);

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late final _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
      autoPlay: true,
    ),
  );

  @override
  void initState() {
    WakelockPlus.enable();
    super.initState();
  }


  @override
  void deactivate() {
    _controller.dispose();
    WakelockPlus.disable();
    super.deactivate();
  }



  @override
  Widget build(BuildContext context) {
    return Center(child: YoutubePlayer(controller: _controller));
  }
}