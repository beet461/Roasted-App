library home;

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  final Function(int i) rel;
  HomePage({required this.rel});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  VideoPlayerController _controller = VideoPlayerController.asset('');

  @override
  void initState() {
    super.initState();
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
                    fontSize: 50,
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
