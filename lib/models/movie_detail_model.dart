class MovieDetailModel {
  final String poster, title, overview;
  final int runtime;
  final List<Genre> genres;

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : poster = json['poster_path'],
        title = json['title'],
        runtime = json['runtime'],
        overview = json['overview'],
        genres = (json['genres'] as List)
            .map((genreJson) => Genre.fromJson(genreJson))
            .toList();
}

class Genre {
  final int id;
  final String name;

  Genre.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];
}
// 영화의 포스터.
// 영화의 제목.
// 영화의 상영시간.
// 영화의 개요.
// 영화의 장르.