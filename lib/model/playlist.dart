class Playlist {
  final String title;
  final String suburl;
  final String url;

  Playlist({required this.title, required this.url, required this.suburl});
  static List<Playlist> playlist = [
    Playlist(
        title: 'English',
        url: 'assets/Screenshot 2023-08-15 151728.png',
        suburl: 'new song 3 songs'),
    Playlist(
        title: 'Malayalam',
        url: 'assets/Screenshot 2023-08-15 151855.png',
        suburl: 'newsong 3 songs'),
    Playlist(
        title: 'Tamil',
        url: 'assets/Screenshot 2023-08-15 151949.png',
        suburl: 'new 3 songs')
  ];
}
