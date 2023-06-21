import 'package:emmanuel_rhythms_app/models/video_type.dart';
import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';
import 'package:wakelock/wakelock.dart';

class VideoWidget extends StatefulWidget {
  final String videoId;
  final VideoType videoType;

  const VideoWidget({Key? key, required this.videoId, required this.videoType})
      : super(key: key);

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late final PodPlayerController _controller;
  bool isLoading = true;

  @override
  void initState() {
    loadVideo();
    Wakelock.enable();
    super.initState();
  }


  @override
  void deactivate() {
    _controller.dispose();
    Wakelock.disable();
    super.deactivate();
  }

  void loadVideo() async {
    final urls = widget.videoType == VideoType.vimeo ? await PodPlayerController
        .getVimeoUrls(widget.videoId) :
    await PodPlayerController.getYoutubeUrls(widget.videoId);

    setState(() => isLoading = false);
    _controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.networkQualityUrls(videoUrls: urls!),
      podPlayerConfig: const PodPlayerConfig(
        videoQualityPriority: [360],
      ),
    )
      ..initialise();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : Center(child: PodVideoPlayer(controller: _controller));
  }
}