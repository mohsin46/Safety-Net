import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SelfDefence extends StatefulWidget {
  @override
  _SelfDefenceState createState() => _SelfDefenceState();
}

class _SelfDefenceState extends State<SelfDefence> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Expanded(
              child: MyYoutubePlayer1(
            url: 'https://www.youtube.com/watch?v=0UqK3tfuu8Q',
          )),
          Expanded(
              child: MyYoutubePlayer1(
                  url: 'https://www.youtube.com/watch?v=T7aNSRoDCmg')),
          Expanded(
              child: MyYoutubePlayer1(
                  url: 'https://www.youtube.com/watch?v=-V4vEyhWDZ0')),
          Expanded(
              child: MyYoutubePlayer1(
                  url: 'https://www.youtube.com/watch?v=Ww1DeUSC94o'))
        ],
      ),
    );
  }
}

class MyYoutubePlayer1 extends StatefulWidget {
  final String url;

  MyYoutubePlayer1({@required this.url});

  @override
  _MyYoutubePlayer1State createState() => _MyYoutubePlayer1State();
}

class _MyYoutubePlayer1State extends State<MyYoutubePlayer1> {
  YoutubePlayerController _controller;

  void runYoutubePlayer(String Givenurl1) {
    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(Givenurl1),
        flags: YoutubePlayerFlags(
          enableCaption: false,
          isLive: false,
          autoPlay: false,
        ));
  }

  @override
  void initState() {
    runYoutubePlayer(widget.url);

    super.initState();
  }

  @override
  void deactivate() {
    _controller.pause();

    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
        ),
        builder: (context, player) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                player,
                SizedBox(
                  height: 40.0,
                ),
              ],
            ),
          );
        });
  }
}
