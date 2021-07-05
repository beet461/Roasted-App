library about;

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  static const header = TextStyle(
    fontSize: 30,
    decoration: TextDecoration.underline,
    color: Colors.grey,
    fontFamily: 'VictorMono',
  );
  static const main = TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontFamily: 'VictorMono',
  );

  static const about_writing = <Widget>[
    Text(
      'About Roasted™',
      style: header,
      textAlign: TextAlign.center,
    ),
    Text(
      'We here at Roasted!™ have created this app for all the young humans out there wanting to fight back. Whether someone is bullying you or making you feel sad, this is the place to get back at them. We provide our services 100% free of charge, you can get insults ranging from weak (for the little annoyances) all the way to EPIC (will make them cry themselves to sleep). Click the generate button on our homepage and get your comeback today! \n',
      style: main,
      textAlign: TextAlign.center,
    ),
    Text(
      '\n For more info visit our website at https://beet461.github.io/Roasted/',
      style: TextStyle(
        fontSize: 20,
        color: Colors.greenAccent,
        fontFamily: 'VictorMono',
      ),
      textAlign: TextAlign.center,
    ),
  ];

  VideoPlayerController _controller = VideoPlayerController.asset('');

  @override
  void initState() {
    super.initState();
    // Pointing the video controller to our local asset.
    _controller =
        VideoPlayerController.asset('assets/videos/moving_triangles.mp4')
          ..initialize().then((_) {
            // Once the video has been loaded we play the video and set looping to true.
            _controller.play();
            _controller.setLooping(true);
            // Ensure the first frame is shown after the video is initialized.
            setState(() {});
          });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
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
            ListView(
              children: about_writing,
              padding: EdgeInsets.all(50),
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
