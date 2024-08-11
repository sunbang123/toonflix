import 'package:flutter/material.dart';
import 'package:toonflix/screens/home_screen.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/models/movie_model.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future: Future.wait([
          ApiService.getPopularMovies(),
          ApiService.getNowPlayingMovies(),
          ApiService.getComingSoonMovies(),
        ]),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<List<MovieModel>> allMovies =
                snapshot.data as List<List<MovieModel>>;
            return HomeScreen(
              popularMovies: allMovies[0],
              nowPlayingMovies: allMovies[1],
              comingSoonMovies: allMovies[2],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:toonflix/screens/home_screen.dart';
// import 'package:toonflix/services/api_service.dart';

// void main() {
//   runApp(const App());
// }

// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: FutureBuilder(
//         future: ApiService.getPopularMovies(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return HomeScreen(movies: snapshot.data!);
//           }
//           return const Center(child: CircularProgressIndicator());
//         },
//       ),
//     );
//   }
// }
