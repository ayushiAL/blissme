import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ChewieListItem extends StatefulWidget {
  final VideoPlayerController controller;
  final bool looping;

  const ChewieListItem(
      {Key? key, required this.controller, required this.looping})
      : super(key: key);

  @override
  State<ChewieListItem> createState() => _ChewieListItemState();
}

class _ChewieListItemState extends State<ChewieListItem> {
  ChewieController? _chewieController;
  Future<void>? _initializeVideoPlayerFuture;

  @override
  void initState() {
    print("object");
    _initializeVideoPlayerFuture = widget.controller.initialize();
    _chewieController = ChewieController(
      videoPlayerController: widget.controller,
      // aspectRatio: 5 / 8,
      autoInitialize: true,
      autoPlay: true,
      looping: widget.looping,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
    super.initState();
  }

  // @override
  // void dispose() async{
  //   super.dispose();
  //   if (widget.controller.value.isPlaying) widget.controller.pause();
  //   widget.controller.dispose();
  //   _chewieController!.dispose();
  //   print(dispose);
  //   // widget.controller.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Chewie(
        controller: _chewieController!,
      ),
    );
  }
}
