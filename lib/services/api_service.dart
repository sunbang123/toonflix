import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:toonflix/models/movie_detail_model.dart';
import 'package:toonflix/models/movie_model.dart';

class ApiService {
  static String baseUrl = "https://movies-api.nomadcoders.workers.dev";
  static String popularEndpoint = "popular";
  static String nowPlayingEndpoint = "now-playing";
  static String comingSoonEndpoint = "coming-soon";
  static String movieEndpoint = "movie";

  static Future<List<MovieModel>> getPopularMovies() async {
    return _getMovies(popularEndpoint);
  }

  static Future<List<MovieModel>> getNowPlayingMovies() async {
    return _getMovies(nowPlayingEndpoint);
  }

  static Future<List<MovieModel>> getComingSoonMovies() async {
    return _getMovies(comingSoonEndpoint);
  }

  static Future<List<MovieModel>> _getMovies(String endpoint) async {
    final url = Uri.parse('$baseUrl/$endpoint');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> results = data['results'];
      return results.map((movie) => MovieModel.fromJson(movie)).toList();
    }
    throw Exception('Failed to load movies');
  }

  static Future<MovieDetailModel> getMovieById(String id) async {
    if (id.isEmpty) {
      throw ArgumentError('Movie Id cannot be empty');
    }
    final url = Uri.parse("$baseUrl/$movieEndpoint")
        .replace(queryParameters: {'id': id});
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final movie = jsonDecode(response.body);
      return MovieDetailModel.fromJson(movie);
    }
    throw Exception('Failed to load movies');
  }
}

// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:toonflix/models/movie_model.dart';

// class ApiService {
//   static String baseUrl = "https://movies-api.nomadcoders.workers.dev";
//   static String endpoint = "popular";

//   static Future<List<MovieModel>> getPopularMovies() async {
//     final url = Uri.parse('$baseUrl/$endpoint');
//     final response = await http.get(url);
//     if (response.statusCode == 200) {
//       final Map<String, dynamic> data = jsonDecode(response.body);
//       final List<dynamic> results = data['results'];
//       return results.map((movie) => MovieModel.fromJson(movie)).toList();
//     }
//     throw Exception('Failed to load movies');
//   }
// }
