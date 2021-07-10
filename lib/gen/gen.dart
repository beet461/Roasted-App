library gen;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:video_player/video_player.dart';
import 'dart:math';

const lvl4_raw =
    "You bring everyone so much joy when you leave the room.\nI'd give you a nasty look but you've already got one.\nSomeday you’ll go far. I hope you stay there.\nWere you born this stupid or did you take lessons?\nYour mouth is bigger than your brain will ever be\nYou should really come with a warning label.\nI don’t know what your problem is, but I’m guessing it’s hard to pronounce.\nIt’s kind of hilarious watching you try to fit your entire vocabulary into one sentence.\nI will ignore you so hard you will start doubting your existence.\nFeed your own ego. I’m busy.\nI’ll never forget the first time we met. But I’ll keep trying.\nYou’re a grey sprinkle on a rainbow cupcake.\nI thought of you today. It reminded me to take out the trash.\nStupidity isn’t a crime, so you’re free to go.\nI’ve been called worse by better.\nDon’t you get tired of putting makeup on your two faces every morning?\nPlease just tell me you don’t plan to home-school your kids.\nYou see that door? I want you on the other side of it.\nYou’re like the end pieces of a loaf of bread. Everyone touches you, but nobody wants you.\nYou are more disappointing than an unsalted pretzel.\nYour face makes onions cry.\nYou’re not stupid! You just have bad luck when you’re thinking.\nHave a nice day, somewhere else.\nIf ignorance is bliss, you must be the happiest person on the planet.\nIf I threw a stick, you’d leave, right?\nSomewhere out there, there’s a tree working very hard to produce oxygen so that you can breathe. I think you should go and apologize to it.";

const lvl3_raw =
    "Don’t get bitter, just get better.What doesn’t kill you, disappoints me.\nAww, it’s so cute when you try to talk about things you don’t understand.\nHey, your village called – they want their idiot back.\nCalling you an idiot would be an insult to all stupid people.\nI am returning your nose. I found it in my business.\nGood story, but in what chapter do you shut up?\nThere are some remarkably dumb people in this world. Thanks for helping me understand that.\nYou need a kiss on the neck from a crocodile.\nMay both sides of your pillow be uncomfortably warm.";

const lvl2_raw =
    "You are like a cloud.When you disappear it’s a beautiful day.\nChild, I’ve forgotten more than you ever knew.\nI’ve seen people like you before, but I had to pay admission.\nI was hoping for a battle of wits but you appear to be unarmed.\nI’ve been called worse by better.\nJealousy is a disease. Get well soon.\nI could eat a bowl of alphabet soup and poop out a smarter statement than whatever you just said.\nPeople like you are the reason I’m on medication.\nEarth is full. Go home.\nWho ate your bowl of sunshine this morning, thundercloud?\nYou fear success, but you really have nothing to worry about.\nKeep rolling your eyes, you might eventually find a brain.\nIf your brain was dynamite, there wouldn’t be enough to blow your hat off.\nYour only purpose in life is to become an organ donor.\nYou are proof that evolution can go in reverse.\nGrab a straw, because you suck.\nRemember when I asked for your opinion? Me neither.\nYou’re about as useful as a glass door on a submarine.\nI believed in evolution until I met you.\nThat sounds like a you problem.\nUnless your name is Google, stop acting like you know everything!\nI told my therapist about you.";

const lvl1_raw =
    "bad\ngo away\nweakling\nunintelligent\nstupid\ndisrespectful\nannoying\nirritation\nsmall brain\ndumb\ni am smarter than you\nrude\nunpleasant";

var lvl4 = lvl4_raw.split("\n");
var lvl3 = lvl3_raw.split("\n");
var lvl2 = lvl2_raw.split("\n");
var lvl1 = lvl1_raw.split("\n");

class Gen extends StatefulWidget {
  const Gen({Key? key}) : super(key: key);

  @override
  _GenState createState() => _GenState();
}

class _GenState extends State<Gen> {
  VideoPlayerController _controller = VideoPlayerController.asset('');

  var rng = new Random();
  var lvl = 2;

  String random() {
    switch (lvl) {
      case 1:
        return lvl1[rng.nextInt(lvl1.length)];
      case 2:
        return lvl2[rng.nextInt(lvl2.length)];
      case 3:
        return lvl3[rng.nextInt(lvl3.length)];
      case 4:
        return lvl4[rng.nextInt(lvl4.length)];
    }
    return '';
  }

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
      body: Center(
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
              child: Container(
                child: ListView(
                  children: <Widget>[
                    Padding(
                      child: Text(
                        random(),
                        style: TextStyle(
                          color: Color(0xFFFF4A1C),
                          fontSize: 10,
                          fontFamily: 'HotFont',
                        ),
                        textAlign: TextAlign.center,
                      ),
                      padding: EdgeInsets.all(100),
                    ),
                    Center(
                      child: ListView(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: FloatingActionButton.extended(
                              label: Text(
                                'weak',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 30,
                                  fontFamily: 'HotFont',
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  lvl = 1;
                                });
                              },
                              backgroundColor: Colors.yellow,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: FloatingActionButton.extended(
                              label: Text(
                                'Witty',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 10,
                                  fontFamily: 'HotFont',
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  lvl = 2;
                                });
                              },
                              backgroundColor: Colors.orangeAccent,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: FloatingActionButton.extended(
                              label: Text(
                                'Amazing',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                  fontFamily: 'HotFont',
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  lvl = 3;
                                });
                              },
                              backgroundColor: Colors.orange,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: FloatingActionButton.extended(
                              label: Text(
                                'EPIC!',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 5,
                                  fontFamily: 'HotFont',
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  lvl = 4;
                                });
                              },
                              backgroundColor: Colors.deepOrangeAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                margin: EdgeInsets.all(50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
