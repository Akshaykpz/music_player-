import 'package:flutter/material.dart';
import 'package:music_app/home/recent_songs.dart';

import 'package:music_app/home/song_new.dart';
import 'package:music_app/model/song_model.dart';

import '../model/playlist.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Song> songs = Song.songs;
    List<Playlist> playlist = Playlist.playlist;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.deepPurple.shade100],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.confirmation_num_sharp,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.confirmation_num_sharp,
              ),
              label: 'Recents'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.confirmation_num_sharp,
              ),
              label: 'Account'),
        ]),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                  backgroundImage: AssetImage('assets/7309681.jpg')),
            )
          ],
          leading: Icon(
            Icons.widgets,
            color: Colors.white,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome...',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                              fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(
                      'Music World',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              fontWeight: FontWeight.w400,
                              color: Colors.white60),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16)),
                          hintText: 'search',
                          fillColor: Colors.white,
                          filled: true),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      // height: 300,
                      // width: 400,

                      height: MediaQuery.of(context).size.height * 0.27,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return SongCard(
                            song: songs[index],
                          );
                        },
                        itemCount: songs.length,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Playlists',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        ListView.builder(
                          key: Key('recent_list'),
                          shrinkWrap: true,
                          itemCount: playlist.length,
                          itemBuilder: (context, index) {
                            return Recent(
                              playlist: playlist[index],
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                )),
          ],
        )),
      ),
    );
  }
}
