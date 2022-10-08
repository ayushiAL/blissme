import 'package:blissme/video_player_demo/chewie_list_item.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MainVideoPlay extends StatefulWidget {
  const MainVideoPlay({Key? key}) : super(key: key);

  @override
  State<MainVideoPlay> createState() => _MainVideoPlayState();
}

class _MainVideoPlayState extends State<MainVideoPlay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: [
          ChewieListItem(
              controller: VideoPlayerController.network(
                  'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
              looping: false),
          ChewieListItem(
              controller: VideoPlayerController.network(
                  'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4'),
              looping: false),
          ChewieListItem(
              controller: VideoPlayerController.network(
                  'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4'),
              looping: false)
        ],
      ),
    );
  }
}
