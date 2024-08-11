import 'package:flutter/material.dart';
import 'package:toonflix/screens/detail_screen.dart';

class Movie extends StatelessWidget {
  final String title, thumb;
  final int id;
  final bool isLarge;

  const Movie({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
    this.isLarge = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              title: title,
              thumb: thumb,
              id: id,
            ),
          ),
        );
      },
      child: Hero(
        tag: id,
        child: Container(
          width: isLarge ? 300 : 150, // 너비 조정
          height: isLarge ? 150 : 225, // 높이 조정
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: NetworkImage(thumb),
              fit: isLarge ? BoxFit.cover : BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:toonflix/screens/detail_screen.dart';

// class Movie extends StatelessWidget {
//   final String title, thumb;
//   final int id;

//   const Movie({
//     super.key,
//     required this.title,
//     required this.thumb,
//     required this.id,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => DetailScreen(
//               title: title,
//               thumb: thumb,
//               id: id,
//             ),
//           ),
//         );
//       },
//       child: Hero(
//         tag: id,
//         child: Container(
//           width: 150, // 너비 조정
//           height: 225, // 높이 조정
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//             image: DecorationImage(
//               image: NetworkImage(thumb),
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:toonflix/screens/detail_screen.dart';

// class Movie extends StatelessWidget {
//   final String title, thumb;
//   final int id;

//   const Movie({
//     super.key,
//     required this.title,
//     required this.thumb,
//     required this.id,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => DetailScreen(
//               title: title,
//               thumb: thumb,
//               id: id,
//             ),
//           ),
//         );
//       },
//       child: Column(
//         children: [
//           Hero(
//             tag: id,
//             child: Container(
//               width: 250,
//               clipBehavior: Clip.hardEdge,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Container(
//                 width: 100, // 원하는 너비
//                 height: 175, // 원하는 높이
//                 child: Image.network(
//                   thumb,
//                   fit: BoxFit.cover, // 이미지를 컨테이너에 맞게 조정
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//         ],
//       ),
//     );
//   }
// }
