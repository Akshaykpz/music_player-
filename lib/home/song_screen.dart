import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/home/seek_bar.dart';
import 'package:music_app/model/song_model.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

class SongScreen extends StatefulWidget {
  const SongScreen({Key? key}) : super(key: key);

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  late AudioPlayer audioPlayer;
  ConcatenatingAudioSource? audioSource; // Define audio source, nullable

  Song currentSong = Song.songs[0]; // Initialize with the first song

  @override
  void initState() {
    super.initState();

    audioPlayer = AudioPlayer(); // Initialize the audio player
    updateAudioSource(currentSong); // Set up audio source for the current song
    audioPlayer.play(); // Play the audio
  }

  void updateAudioSource(Song song) {
    audioSource = ConcatenatingAudioSource(
      children: [AudioSource.uri(Uri.parse('asset:${song.url}'))],
    );
    audioPlayer.setAudioSource(audioSource!); // Set the updated audio source
  }

  @override
  void dispose() {
    audioPlayer.dispose(); // Dispose the audioPlayer instance
    super.dispose();
  }

  Stream<Seekbardata> get _seekbardataStream =>
      rxdart.Rx.combineLatest2<Duration, Duration?, Seekbardata>(
          audioPlayer.positionStream, audioPlayer.durationStream,
          (Duration position, Duration? duration) {
        return Seekbardata(position, duration ?? Duration.zero);
      });

  @override
  Widget build(BuildContext context) {
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                StreamBuilder<Seekbardata>(
                  stream: _seekbardataStream,
                  builder: (context, snapshot) {
                    final positionData = snapshot.data;
                    return SeekBar(
                      duration: positionData?.duration ?? Duration.zero,
                      position: positionData?.postion ?? Duration.zero,
                      onchnagedend: audioPlayer.seek,
                    );
                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StreamBuilder<PlayerState>(
                      stream: audioPlayer.playerStateStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final playerState = snapshot.data;
                          final processingState =
                              (playerState! as PlayerState).processingState;
                          if (processingState == ProcessingState.loading ||
                              processingState == ProcessingState.buffering) {
                            return Container(
                              width: 60,
                              height: 60,
                              margin: const EdgeInsets.all(10),
                              child: const CircularProgressIndicator(),
                            );
                          } else {
                            return IconButton(
                              onPressed: () {
                                if (audioPlayer.playing) {
                                  audioPlayer.pause();
                                } else {
                                  audioPlayer.play();
                                }
                              },
                              icon: Icon(
                                audioPlayer.playing
                                    ? Icons.pause
                                    : Icons.play_circle,
                                size: 75,
                                color: Colors.white,
                              ),
                            );
                          }
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.deepPurple.shade700.withOpacity(0.8),
                  Colors.deepPurple.shade800.withOpacity(0.1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
