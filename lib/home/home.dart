library home;

// Video player library does not support sound null safety, so the --no-sound-null-safety flag must be used at compiletime
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// This class requires onTap function from Page class, because a button will redirect to another page
class HomePage extends StatefulWidget {
  final Function(int i) rel;
  HomePage({required this.rel});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  // Creating a video player controller
  VideoPlayerController _controller = VideoPlayerController.asset('');

  @override
  void initState() {
    super.initState();
    // Setting the video to fire_edges.mp4
    // After initialization it will play the video and set it to looping
    _controller = VideoPlayerController.asset('assets/videos/fire_edges.mp4')
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.fill,
                child: SizedBox(
                  width: _controller.value.size?.width ?? 0,
                  height: _controller.value.size?.height ?? 0,
                  child: VideoPlayer(_controller),
                ),
              ),
            ),
            Center(
              child: FloatingActionButton.extended(
                label: Text(
                  '🔥 GENERATE 🔥',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Blazed',
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  widget.rel(0);
                },
                backgroundColor: Colors.deepOrangeAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
