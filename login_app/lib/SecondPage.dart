import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/main.dart';

typedef void OnError(Exception exception);

void main() {
  runApp(new MaterialApp(home: new ExampleApp()));
}

class ExampleApp extends StatefulWidget {
  @override
  _ExampleAppState createState() => new _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  Duration _duration = new Duration();
  Duration _position = new Duration();
  AudioPlayer advancedPlayer;
  AudioCache audioCache;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);

    advancedPlayer.durationHandler = (d) => setState(() {
          _duration = d;
        });

    advancedPlayer.positionHandler = (p) => setState(() {
          _position = p;
        });
  }

  String localFilePath;

  Widget _tab(List<Widget> children) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/alienware.jpg"),
          fit: BoxFit.cover,
        )),
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: children
              .map((w) => Container(child: w, padding: EdgeInsets.all(3.0)))
              .toList(),
        ),
      ),
    );
  }

  Widget _btn(String txt, VoidCallback onPressed) {
    return ButtonTheme(
      child: Align(
        child: SizedBox(
            width: 80.0,
            child: ElevatedButton(child: Text(txt), onPressed: onPressed)),
      ),
    );
  }

  Widget _songname(String txt, VoidCallback onPressed) {
    return ButtonTheme(
      child: Align(
        child: SizedBox(
            height: 50.0,
            width: 250.0,
            child: ElevatedButton(
              child: Text(txt),
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                  primary: Colors.black54,
                  onPrimary: Colors.amber,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                  textStyle: TextStyle(
                      fontSize: 13,
                      //fontWeight: FontWeight.bold
                  )),
            )),
      ),
    );
  }

  Widget slider() {
    return Slider(
        value: _position.inSeconds.toDouble(),
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            seekToSecond(value.toInt());
            value = value;
          });
        });
  }

  Widget localAsset() {
    return _tab([
      Text('Play Local Asset \'audio.mp3\':'),
      _songname('Play Animals', () => audioCache.play('audio.mp3')),
      _songname('Play Stereo Love', () => audioCache.play('audio2.mp3')),
      _songname('Play City Of Stars', () => audioCache.play('audio3.mp3')),
      _songname('Play Dance Monkey', () => audioCache.play('audio4.mp3')),
      _songname('Play La La La', () => audioCache.play('audio5.mp3')),
      _btn('Pause', () => advancedPlayer.pause()),
      _btn('Stop', () => advancedPlayer.stop()),
      slider(),
      FloatingActionButton(
        heroTag: "btn5",
        onPressed: () {
          Navigator.pop(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage()),
          );
        },
        tooltip: 'Skip',
        child: Icon(Icons.cancel),
      ),
    ]);
  }

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);

    advancedPlayer.seek(newDuration);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: 'Local Asset'),
            ],
          ),
          title: Text('Diablo Music'),
        ),
        body: TabBarView(
          children: [localAsset()],
        ),
      ),
    );
  }
}
