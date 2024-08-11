import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:toonflix/models/movie_model.dart';

class ApiService {
  static String baseUrl = "https://movies-api.nomadcoders.workers.dev";
  static String endpoint = "popular";

  static Future<List<MovieModel>> getPopularMovies() async {
    final url = Uri.parse('$baseUrl/$endpoint');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> results = data['results'];
      return results.map((movie) => MovieModel.fromJson(movie)).toList();
    }
    throw Exception('Failed to load movies');
  }
}
