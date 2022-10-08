import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoChewieApp extends StatefulWidget {
  const VideoChewieApp({
    Key? key,
  }) : super(key: key);

  @override
  _VideoChewieAppState createState() => _VideoChewieAppState();
}

class _VideoChewieAppState extends State<VideoChewieApp> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  late ChewieController _chewieController;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');
    _initializeVideoPlayerFuture = _controller.initialize();

    _chewieController = ChewieController(
      videoPlayerController: _controller,
      aspectRatio: 5 / 8,
      autoInitialize: true,
      autoPlay: true,
      looping: true,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                FutureBuilder(
                  future: _initializeVideoPlayerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
                Container(
                  //duration of video
                  child: Text(
                      "Total Duration: ${_controller.value.duration.toString()}"),
                ),
                Container(
                    child: VideoProgressIndicator(_controller,
                        allowScrubbing: true,
                        colors: VideoProgressColors(
                          backgroundColor: Colors.redAccent,
                          playedColor: Colors.green,
                          bufferedColor: Colors.purple,
                        ))),
                IconButton(
                    onPressed: () {
                      _controller.seekTo(Duration(seconds: 0));

                      setState(() {});
                    },
                    icon: Icon(Icons.stop))
              ],
            ),
          ),
        ],
      ),
      // Center(
      //   child: _controller.value.isInitialized
      //       ? AspectRatio(
      //     aspectRatio: _controller.value.aspectRatio,
      //     child: VideoPlayer(_controller),
      //   )
      //       : Container(),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
