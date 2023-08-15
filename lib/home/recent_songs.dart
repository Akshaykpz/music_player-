import 'package:flutter/material.dart';
import 'package:music_app/model/playlist.dart';

class Recent extends StatelessWidget {
  final Playlist playlist;
  const Recent({super.key, required this.playlist});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.deepPurple, borderRadius: BorderRadius.circular(10)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              playlist.url,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            )),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                playlist.title,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Text(
                playlist.suburl,
                style: TextStyle(color: Colors.white, fontSize: 14),
              )
            ],
          ),
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.play_circle,
              color: Colors.white,
            ))
      ]),
      // decoration: BoxDecoration(
      //   color: Colors.red,
      //   borderRadius: BorderRadius.circular(10),
    );
  }
}
