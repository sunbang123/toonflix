import 'package:flutter/material.dart';
import 'package:toonflix/models/movie_model.dart';
import 'package:toonflix/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, required List<MovieModel> movies});

  final Future<List<MovieModel>> movies = ApiService.getPopularMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Center(
          child: Text(
            "오늘의 영화",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: movies,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var movie = snapshot.data![index];
                return Text(movie.title);
              },
              separatorBuilder: (context, index) => const SizedBox(width: 20),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:toonflix/models/movie_model.dart';
// import 'package:toonflix/services/api_service.dart';

// class HomeScreen extends StatelessWidget {
//   HomeScreen({super.key, required List<MovieModel> movies});

//   Future<List<MovieModel>> movies = ApiService.getPopularMovies();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 2,
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.green,
//         title: const Center(
//           child: Text(
//             "오늘의 영화",
//             style: TextStyle(
//               fontSize: 24,
//             ),
//           ),
//         ),
//       ),
//       body: FutureBuilder(
//         future: movies,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return const Text("There is data!");
//           }
//           return const Text('Loading....');
//         },
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:toonflix/models/movie_model.dart';
// import 'package:toonflix/services/api_service.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key, required List<MovieModel> movies});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   List<MovieModel> movies = [];
//   bool isLoading = true;

//   void waitForMovies() async {
//     movies = await ApiService.getPopularMovies();
//     isLoading = false;
//     setState(() {});
//   }

//   @override
//   void initState() {
//     super.initState();
//     waitForMovies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     print(movies);
//     print(isLoading);
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 2,
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.green,
//         title: const Center(
//           child: Text(
//             "오늘의 영화",
//             style: TextStyle(
//               fontSize: 24,
//             ),
//           ),
//         ),
//       ),
//       body: const Center(
//         child: Text("Home Screen Content"),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:toonflix/models/movie_model.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key, required List<MovieModel> movies});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 2,
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.green,
//         title: const Center(
//           child: Text(
//             "오늘의 영화",
//             style: TextStyle(
//               fontSize: 24,
//             ),
//           ),
//         ),
//       ),
//       body: const Center(
//         child: Text("Home Screen Content"),
//       ),
//     );
//   }
// }
