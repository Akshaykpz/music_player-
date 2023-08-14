import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/model/song_model.dart';

class SongScreen extends StatefulWidget {
  const SongScreen({super.key});

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  @override
  Widget build(BuildContext context) {
    // AudioPlayer audioPlayer = AudioPlayer();
    // Song song=Song.songs[2];
    // @override
    // void initState() {
    //   super.initState();
    //   audioPlayer.setAudioSource(AudioSource.uri(uri))
    // }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/blue-wall-background.jpg',
            fit: BoxFit.fill,
          ),
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
            Colors.deepPurple.shade700.withOpacity(0.2),
            Colors.deepPurple.shade800.withOpacity(0.8)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter))),
        ],
      ),
    );
  }
}
