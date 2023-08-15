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
        url: 'assets/good-night-160166.mp3',
        coverurl: 'assets/tobias-tullius-ms5KaYqstdQ-unsplash.jpg'),
    Song(
        descriptions: 'songs',
        title: 'eglsihsong',
        url: 'assets/lofi-chill-medium-version-159456.mp3',
        coverurl: 'assets/mark-cruz-w3-zaydSNRY-unsplash.jpg'),
    Song(
        descriptions: 'songs',
        title: 'eglsihsong',
        url: 'assets/lofi-chill-medium-version-159456.mp3',
        coverurl: 'assets/lee-campbell-1w1OMV8CEeM-unsplash.jpg')
  ];
}
