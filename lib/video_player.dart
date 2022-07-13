import 'package:flutter/material.dart';
import 'package:rewire/utils/font_style_utils.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({Key? key}) : super(key: key);

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _videoPlayerController;
  bool isPlay = false;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(
        'https://www.appsloveworld.com/wp-content/uploads/2018/10/640.mp4')
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController.play();
      });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _videoPlayerController.value.isInitialized
            ? AspectRatio(
                aspectRatio: _videoPlayerController.value.aspectRatio,
                child: VideoPlayer(_videoPlayerController))
            : Container(),
        Padding(
          padding: EdgeInsets.all(20),
        ),
        VideoProgressIndicator(
          _videoPlayerController,
          allowScrubbing: true,
          colors: VideoProgressColors(
              backgroundColor: Colors.red,
              bufferedColor: Colors.black,
              playedColor: Colors.blueAccent),
        ),
        Row(
          children: [
            Text(
              _videoPlayerController.value.position.inSeconds.toString(),
              style: FontTextStyle.poppinsW5S16white,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  _videoPlayerController.seekTo(Duration(
                      seconds: _videoPlayerController.value.position.inSeconds -
                          10));
                },
                child: Icon(
                  Icons.fast_rewind_outlined,
                  color: Colors.white,
                  size: 30,
                )),
            Padding(padding: EdgeInsets.all(2)),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    fixedSize: MaterialStateProperty.all(Size(70, 70)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)))),
                onPressed: () {
                  setState(() {
                    isPlay = !isPlay;
                  });
                  isPlay
                      ? _videoPlayerController.play()
                      : _videoPlayerController.pause();
                },
                child: isPlay
                    ? Icon(
                        Icons.pause,
                        color: Colors.black,
                        size: 30,
                      )
                    : Icon(
                        Icons.play_arrow,
                        color: Colors.black,
                        size: 30,
                      )),
            Padding(padding: EdgeInsets.all(2)),
            GestureDetector(
                onTap: () {
                  _videoPlayerController.seekTo(Duration(
                      seconds: _videoPlayerController.value.position.inSeconds +
                          10));
                },
                child: Icon(
                  Icons.fast_forward_outlined,
                  color: Colors.white,
                  size: 30,
                )),
          ],
        )
      ],
    );
  }
}
