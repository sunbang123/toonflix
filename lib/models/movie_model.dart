class MovieModel {
  final String title, posterPath;
  final int id;

  MovieModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        posterPath = json['poster_path'],
        id = json['id'];

  String get thumb => 'https://image.tmdb.org/t/p/w500$posterPath';
}

// class MovieModel {
//   final String title, poster_path;
//   final int id;

//   MovieModel.fromJson(Map<String, dynamic> json)
//       : title = json['title'],
//         poster_path = json['poster_path'],
//         id = json['id'];

//   // String get fullPosterPath =
// }
