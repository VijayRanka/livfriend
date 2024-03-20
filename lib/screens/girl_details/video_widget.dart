import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class VideoWidget extends StatefulWidget {
  final String videoPath;

  const VideoWidget({required this.videoPath, Key? key}) : super(key: key);

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _videoPlayerController;
  late Future<void> _initializeVideoPlayerController;
  bool notRunning = false;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.videoPath);
    _initializeVideoPlayerController =
        _videoPlayerController.initialize().then((value) {
          _videoPlayerController.play();
          _videoPlayerController.setLooping(false);
          _videoPlayerController.setVolume(0);
          setState(() {});
        }).onError((error, stackTrace) {
          setState(() {
            notRunning = true;
          });
        });
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerController,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: 160,
              width: 100,
              child: Stack(
                children: <Widget>[
                  SizedBox.expand(
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: _videoPlayerController.value.size.width,
                        height: _videoPlayerController.value.size.height,
                        child: VideoPlayer(_videoPlayerController),
                      ),
                    ),
                  ),
                  //FURTHER IMPLEMENTATION
                ],
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}