import 'package:flutter/material.dart';
import 'package:toonflix/screens/home_screen.dart';
import 'package:toonflix/services/api_service.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future: ApiService.getPopularMovies(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen(movies: snapshot.data!);
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
//   ApiService().getPopularMovies();
//   runApp(const App());
// }

// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: FutureBuilder(
//         future: ApiService().getPopularMovies(),
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


// import 'package:flutter/material.dart';
// import 'package:toonflix/screens/home_screen.dart';
// import 'package:toonflix/services/api_service.dart';

// void main() {
//   ApiService().getTodaysToons();
//   runApp(const App());
// }

// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: HomeScreen(),
//     );
//   }
// }
