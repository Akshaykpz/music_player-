import 'package:flutter/material.dart';

import 'package:music_app/home/song_new.dart';
import 'package:music_app/model/song_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Song> songs = Song.songs;
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
              label: 'hello'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.confirmation_num_sharp,
              ),
              label: 'hello'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.confirmation_num_sharp,
              ),
              label: 'hello'),
        ]),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(),
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
                      'Welcome',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                              fontWeight: FontWeight.bold, color: Colors.white),
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
                    SizedBox(
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
                  ],
                )),
          ],
        )),
      ),
    );
  }
}
