import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  static String id = "VideoPage";
  final VideoPlayerController videoPlayerController ;
  final bool looping;

  const VideoPage({Key key, this.videoPlayerController, this.looping}) : super(key: key);
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  ChewieController _chewieController;
  @override
  void initState() {
    super.initState();
    //Wrapper on top of videoPlayerController
    _chewieController =ChewieController(
      videoPlayerController:  widget.videoPlayerController,
      aspectRatio: 16/9,
      autoInitialize: true,
        looping: widget.looping,
      errorBuilder: (context , errorMessage){
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Chewie(
        controller: _chewieController,
    );
  }
  @override
  void dispose() {
    super.dispose();
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }
}


