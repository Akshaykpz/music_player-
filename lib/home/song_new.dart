import 'package:flutter/material.dart';
import 'package:music_app/home/song_screen.dart';
import 'package:music_app/model/song_model.dart';

class SongCard extends StatelessWidget {
  const SongCard({super.key, required this.song});
  final Song song;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SongScreen(),
            ));
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        child: Stack(children: [
          Container(
              width: MediaQuery.of(context).size.width * 0.40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(song.coverurl), fit: BoxFit.fill),
              )),
        ]),
      ),
    );
  }
}
