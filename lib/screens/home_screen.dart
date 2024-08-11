import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:toonflix/models/movie_model.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widgets/movie_widget.dart';

class HomeScreen extends StatelessWidget {
  final List<MovieModel> popularMovies;
  final List<MovieModel> nowPlayingMovies;
  final List<MovieModel> comingSoonMovies;

  const HomeScreen({
    super.key,
    required this.popularMovies,
    required this.nowPlayingMovies,
    required this.comingSoonMovies,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },
          scrollbars: true,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildMovieSection("Popular Movies", popularMovies, isLarge: true),
              buildMovieSection("Now in Cinemas", nowPlayingMovies),
              buildMovieSection("Coming Soon", comingSoonMovies),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMovieSection(String title, List<MovieModel> movies,
      {bool isLarge = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: isLarge ? 220 : 180,
          child: makeList(movies, isLarge: isLarge),
        ),
      ],
    );
  }

  ListView makeList(List<MovieModel> movies, {bool isLarge = false}) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: movies.length,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      itemBuilder: (context, index) {
        var movie = movies[index];
        return isLarge
            ? Movie(
                title: movie.title,
                thumb: movie.thumb,
                id: movie.id,
              )
            : SizedBox(
                width: 100,
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          movie.thumb,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      movie.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
      },
      separatorBuilder: (context, index) => SizedBox(width: isLarge ? 40 : 20),
    );
  }
}


// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:toonflix/models/movie_model.dart';
// import 'package:toonflix/services/api_service.dart';
// import 'package:toonflix/widgets/movie_widget.dart';

// class HomeScreen extends StatelessWidget {
//   final List<MovieModel> popularMovies;
//   final List<MovieModel> nowPlayingMovies;
//   final List<MovieModel> comingSoonMovies;

//   const HomeScreen({
//     super.key,
//     required this.popularMovies,
//     required this.nowPlayingMovies,
//     required this.comingSoonMovies,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//       ),
//       body: ScrollConfiguration(
//         behavior: ScrollConfiguration.of(context).copyWith(
//           dragDevices: {
//             PointerDeviceKind.touch,
//             PointerDeviceKind.mouse,
//           },
//           scrollbars: true,
//         ),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               buildMovieSection("Popular Movies", popularMovies, isLarge: true),
//               buildMovieSection("Now Playing", nowPlayingMovies),
//               buildMovieSection("Coming Soon", comingSoonMovies),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildMovieSection(String title, List<MovieModel> movies,
//       {bool isLarge = false}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SizedBox(height: 15),
//         Padding(
//           padding: const EdgeInsets.only(left: 20.0),
//           child: Text(
//             title,
//             style: const TextStyle(
//               fontSize: 22,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         const SizedBox(height: 15),
//         SizedBox(
//           height: isLarge ? 220 : 180,
//           child: makeList(movies, isLarge: isLarge),
//         ),
//       ],
//     );
//   }

//   ListView makeList(List<MovieModel> movies, {bool isLarge = false}) {
//     return ListView.separated(
//       scrollDirection: Axis.horizontal,
//       itemCount: movies.length,
//       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//       itemBuilder: (context, index) {
//         var movie = movies[index];
//         return isLarge
//             ? Movie(
//                 title: movie.title,
//                 thumb: movie.thumb,
//                 id: movie.id,
//               )
//             : SizedBox(
//                 width: 100,
//                 child: Column(
//                   children: [
//                     Expanded(
//                       child: Image.network(
//                         movie.thumb,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     const SizedBox(height: 5),
//                     Text(
//                       movie.title,
//                       textAlign: TextAlign.center,
//                       style: const TextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.w500,
//                       ),
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ],
//                 ),
//               );
//       },
//       separatorBuilder: (context, index) => SizedBox(width: isLarge ? 40 : 20),
//     );
//   }
// }



// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:toonflix/models/movie_model.dart';
// import 'package:toonflix/services/api_service.dart';
// import 'package:toonflix/widgets/movie_widget.dart';

// class HomeScreen extends StatelessWidget {
//   final List<MovieModel> popularMovies;
//   final List<MovieModel> nowPlayingMovies;
//   final List<MovieModel> comingSoonMovies;

//   const HomeScreen({
//     super.key,
//     required this.popularMovies,
//     required this.nowPlayingMovies,
//     required this.comingSoonMovies,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//       ),
//       body: ScrollConfiguration(
//         behavior: ScrollConfiguration.of(context).copyWith(
//           dragDevices: {
//             PointerDeviceKind.touch,
//             PointerDeviceKind.mouse,
//           },
//           scrollbars: true,
//         ),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               buildMovieSection("Popular Movies", popularMovies),
//               buildMovieSection("Now Playing", nowPlayingMovies),
//               buildMovieSection("Coming Soon", comingSoonMovies),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildMovieSection(String title, List<MovieModel> movies) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SizedBox(height: 15),
//         Padding(
//           padding: const EdgeInsets.only(left: 20.0),
//           child: Text(
//             title,
//             style: const TextStyle(
//               fontSize: 22,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         const SizedBox(height: 15),
//         SizedBox(
//           height: 220,
//           child: makeList(movies),
//         ),
//       ],
//     );
//   }

//   ListView makeList(List<MovieModel> movies) {
//     return ListView.separated(
//       scrollDirection: Axis.horizontal,
//       itemCount: movies.length,
//       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//       itemBuilder: (context, index) {
//         var movie = movies[index];
//         return Movie(
//           title: movie.title,
//           thumb: movie.thumb,
//           id: movie.id,
//         );
//       },
//       separatorBuilder: (context, index) => const SizedBox(width: 40),
//     );
//   }
// }

// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:toonflix/models/movie_model.dart';
// import 'package:toonflix/services/api_service.dart';
// import 'package:toonflix/widgets/movie_widget.dart';

// class HomeScreen extends StatelessWidget {
//   HomeScreen({super.key});

//   final Future<List<MovieModel>> popularMovies = ApiService.getPopularMovies();
//   final Future<List<MovieModel>> nowPlayingMovies =
//       ApiService.getNowPlayingMovies();
//   final Future<List<MovieModel>> comingSoonMovies =
//       ApiService.getComingSoonMovies();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//       ),
//       body: ScrollConfiguration(
//         behavior: ScrollConfiguration.of(context).copyWith(
//           dragDevices: {
//             PointerDeviceKind.touch,
//             PointerDeviceKind.mouse,
//           },
//           scrollbars: true,
//         ),
//         child: FutureBuilder(
//           future: popularMovies,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start, // 텍스트를 왼쪽에 정렬
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 20.0),
//                     child: Text(
//                       "Popular Movies",
//                       style: const TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   Expanded(child: makeList(snapshot))
//                 ],
//               );
//             }
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   ListView makeList(AsyncSnapshot<List<MovieModel>> snapshot) {
//     return ListView.separated(
//       scrollDirection: Axis.horizontal,
//       itemCount: snapshot.data!.length,
//       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//       itemBuilder: (context, index) {
//         var movie = snapshot.data![index];
//         return Movie(
//           title: movie.title,
//           thumb: movie.thumb,
//           id: movie.id,
//         );
//       },
//       separatorBuilder: (context, index) => const SizedBox(width: 40),
//     );
//   }
// }
