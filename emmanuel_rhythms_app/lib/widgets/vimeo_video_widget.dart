import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';

class VimeoVideoWidget extends StatefulWidget {
  final String videoId;

  const VimeoVideoWidget({Key? key, required this.videoId}) : super(key: key);

  @override
  State<VimeoVideoWidget> createState() => _VimeoVideoWidgetState();
}

class _VimeoVideoWidgetState extends State<VimeoVideoWidget> {
  late final PodPlayerController _controller;
  bool isLoading = true;

  @override
  void initState() {
    loadVideo();
    super.initState();
  }

  void loadVideo() async {
    final urls = await PodPlayerController.getVimeoUrls(widget.videoId);
    setState(() => isLoading = false);
    _controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.networkQualityUrls(videoUrls: urls!),
      podPlayerConfig: const PodPlayerConfig(
        videoQualityPriority: [360],
      ),
    )..initialise();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : Center(child: PodVideoPlayer(controller: _controller));
  }
}