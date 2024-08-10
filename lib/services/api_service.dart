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
      // results.map((movie) {
      //   print(movie);
      //   return MovieModel.fromJson(movie);
      // }).toList();
      return results.map((movie) => MovieModel.fromJson(movie)).toList();
    }
    throw Exception('Failed to load movies');
  }
}






// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:toonflix/models/movie_model.dart';

// class ApiService {
//   final String baseUrl = "https://movies-api.nomadcoders.workers.dev";
//   final String endpoint = "popular";

//   Future<List<MovieModel>> getPopularMovies() async {
//     final url = Uri.parse('$baseUrl/$endpoint');
//     final response = await http.get(url);
//     if (response.statusCode == 200) {
//       final Map<String, dynamic> data = jsonDecode(response.body);
//       final List<dynamic> results = data['results'];
//       // results.map((movie) {
//       //   print(movie);
//       //   return MovieModel.fromJson(movie);
//       // }).toList();
//       return results.map((movie) => MovieModel.fromJson(movie)).toList();
//     }
//     throw Exception('Failed to load movies');
//   }
// }




// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:toonflix/models/movie_model.dart';

// class ApiService {
//   final String baseUrl = "https://movies-api.nomadcoders.workers.dev";
//   final String endpoint = "popular";

//   Future<List<MovieModel>> getPopularMovies() async {
//     final url = Uri.parse('$baseUrl/$endpoint');
//     final response = await http.get(url);
//     if (response.statusCode == 200) {
//       final Map<String, dynamic> data = jsonDecode(response.body);
//       final List<dynamic> results = data['results'];
//       // results.map((movie) {
//       //   print(movie);
//       //   return MovieModel.fromJson(movie);
//       // }).toList();
//       return results.map((movie) => MovieModel.fromJson(movie)).toList();
//     }
//     throw Exception('Failed to load movies');
//   }
// }

// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:toonflix/models/movie_model.dart';

// class ApiService {
//   final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
//   final String endpoint = "popular";

//   Future<List<MovieModel>> getTodaysToons() async {
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


// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:toonflix/models/movie_model.dart';

// class ApiService {
//   final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
//   final String endpoint = "popular";

//   Future<List<MovieModel>> getTodaysToons() async {
//     List<MovieModel> movieInstances = [];
//     final url = Uri.parse('$baseUrl/$endpoint');
//     final response = await http.get(url);
//     if (response.statusCode == 200) {
//       final Map<String, dynamic> movies = jsonDecode(response.body);
//       final List<dynamic> data = movies['results'];
//       for (var movie in data) {
//         movieInstances.add(MovieModel.fromJson(movie));
//       }
//       return movieInstances;
//     }
//     throw Exception('Failed to load movies');
//   }
// }

// import 'package:http/http.dart' as http;

// class ApiService {
//   final String baseUrl = "https://movies-api.nomadcoders.workers.dev";
//   final String today = "popular";

//   void getTodaysToons() async {
//     final url = Uri.parse('$baseUrl/$today');
//     final response = await http.get(url);
//     if (response.statusCode == 200) {
//       print(response.body);
//       return;
//     }
//     throw Error();
//   }
// }
