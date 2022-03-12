import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:spotifyclone/models/music.dart';
import 'package:spotifyclone/screens/home.dart';
import 'package:spotifyclone/screens/search.dart';
import 'package:spotifyclone/screens/yourlibrary.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AudioPlayer _audioPlayer = new AudioPlayer();
  var Tabs = [];
  int currentTabIndex = 0;
  bool isPlaying = false;
  Music? music;
  Widget miniPlayer(Music? music, {bool stop = false}) {
    this.music = music;

    if (music == null) {
      return SizedBox();
    }
    if (stop) {
      isPlaying = false;
      _audioPlayer.stop();
    }
    setState(() {});
    Size deviceSize = MediaQuery.of(context).size;
    return AnimatedContainer(
        duration: const Duration(milliseconds: 560),
        color: Colors.blueGrey,
        width: deviceSize.width,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(music.imageUrl, fit: BoxFit.cover),
            Text(
              music.name,
              style: TextStyle(color: Colors.white),
            ),
            IconButton(
              onPressed: () async {
                isPlaying = !isPlaying;
                if (isPlaying) {
                  await _audioPlayer.play(music.audioUrl);
                } else {
                  await _audioPlayer.pause();
                }
                setState(() {});
              },
              icon: isPlaying
                  ? Icon(Icons.pause, color: Colors.white)
                  : Icon(Icons.play_arrow, color: Colors.white),
            )
          ],
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Tabs = [Home(miniPlayer), Search(), YourLibrary()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Tabs[currentTabIndex],
      backgroundColor: Colors.black,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          miniPlayer(music),
          BottomNavigationBar(
            currentIndex: currentTabIndex,
            onTap: (currentIndex) {
              currentTabIndex = currentIndex;
              setState(() {});
            },
            selectedLabelStyle: TextStyle(color: Colors.white),
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.white), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search, color: Colors.white),
                  label: "Search"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.my_library_music_outlined,
                      color: Colors.white),
                  label: "Your Library"),
            ],
          ),
        ],
      ),
    );
  }
}
