class Song {
  final String title;
  final String url;
  final String descriptions;
  final String coverurl;
  Song(
      {required this.descriptions,
      required this.title,
      required this.url,
      required this.coverurl});
  static List<Song> songs = [
    Song(
        descriptions: 'songs',
        title: 'eglsihsong',
        url: 'assets/come-with-me-133764.mp3',
        coverurl: 'assets/tobias-tullius-ms5KaYqstdQ-unsplash.jpg'),
    Song(
        descriptions: 'songs',
        title: 'eglsihsong',
        url: 'assets/come-with-me-133764.mp3',
        coverurl: 'assets/tobias-tullius-ms5KaYqstdQ-unsplash.jpg'),
    Song(
        descriptions: 'songs',
        title: 'eglsihsong',
        url: 'assets/come-with-me-133764.mp3',
        coverurl: 'assets/tobias-tullius-ms5KaYqstdQ-unsplash.jpg')
  ];
}
