import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VedioPage extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;
  VedioPage({
    this.videoPlayerController,
    this.looping
}) ;
  @override
  _VedioPageState createState() => _VedioPageState();
}

class _VedioPageState extends State<VedioPage> {
  ChewieController _chewieController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Wrapper on top of vedioPlayerController
    _chewieController =ChewieController(
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: 16/9,
      autoInitialize: true,
        looping: widget.looping,
      errorBuilder: (context , errorMessege){
        return Center(
          child: Text(
            errorMessege,
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
    // TODO: implement dispose
    super.dispose();
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }
}


