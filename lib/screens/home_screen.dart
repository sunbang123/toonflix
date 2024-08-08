import 'dart:async';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const int defaultTime = 1500;
  int totalSeconds = defaultTime;
  bool isRunning = false;
  int totalPomodoros = 0;
  int roundsCompleted = 0;
  int goalsCompleted = 0;
  late Timer timer;
  int selectedTime = 25; // Default to 25 minutes

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        totalPomodoros += 1;
        if (totalPomodoros % 4 == 0) {
          roundsCompleted += 1;
          totalSeconds = 300; // 5 minutes break
        } else {
          totalSeconds = selectedTime * 60;
        }
        isRunning = false;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds -= 1;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onResetPressed() {
    timer.cancel();
    setState(() {
      totalSeconds = selectedTime * 60;
      isRunning = false;
    });
  }

  void onSelectTime(int minutes) {
    setState(() {
      selectedTime = minutes;
      totalSeconds = minutes * 60;
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".").first.substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                format(totalSeconds),
                style: TextStyle(
                  backgroundColor: Theme.of(context).cardColor,
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Center(
              child: IconButton(
                iconSize: 120,
                color: Theme.of(context).cardColor,
                onPressed: isRunning ? onPausePressed : onStartPressed,
                icon: Icon(isRunning
                    ? Icons.pause_circle_outline
                    : Icons.play_circle_outline),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [15, 20, 25, 30, 35].map((e) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ElevatedButton(
                        onPressed: () => onSelectTime(e),
                        child: Text('$e'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: selectedTime == e
                              ? Colors.white
                              : const Color.fromARGB(255, 255, 166, 92),
                          foregroundColor:
                              selectedTime == e ? Colors.black : Colors.white,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: onResetPressed,
                        child: Text('Reset'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            '$totalPomodoros',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .color,
                            ),
                          ),
                          Text(
                            'Pomodoros',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .color,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '$roundsCompleted',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .color,
                            ),
                          ),
                          Text(
                            'Rounds',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .color,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '$goalsCompleted',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .color,
                            ),
                          ),
                          Text(
                            'Goals',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .color,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: HomeScreen(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.red,
          secondary: Colors.orange,
        ),
        cardColor: Colors.white,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(color: Colors.black),
        ),
      ),
    ),
  );
}



// import 'dart:async';
// import 'package:flutter/material.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   static const twentyFiveMinutes = 1500;
//   int totalSeconds = twentyFiveMinutes;
//   bool isRunning = false;
//   int totalPomodoros = 0;
//   late Timer timer;

//   void onTick(Timer timer) {
//     if (totalSeconds == 0) {
//       setState(() {
//         totalSeconds = totalSeconds + 1;
//         isRunning = false;
//         totalSeconds = twentyFiveMinutes;
//       });
//       timer.cancel();
//     } else {
//       setState(() {
//         totalSeconds = totalSeconds - 1;
//       });
//     }
//   }

//   void onStartPressed() {
//     timer = Timer.periodic(
//       const Duration(seconds: 1),
//       onTick,
//     );
//     setState(() {
//       isRunning = true;
//     });
//   }

//   void onPausePressed() {
//     timer.cancel();
//     setState(() {
//       isRunning = false;
//     });
//   }

//   String format(int seconds) {
//     var duration = Duration(seconds: seconds);
//     return duration.toString().split(".").first.substring(2, 7);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.primary,
//       body: Column(
//         children: [
//           Flexible(
//             flex: 1,
//             child: Container(
//               alignment: Alignment.bottomCenter,
//               child: Text(
//                 format(totalSeconds),
//                 style: TextStyle(
//                   color: Theme.of(context).cardColor,
//                   fontSize: 89,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//           ),
//           Flexible(
//             flex: 3,
//             child: Center(
//               child: IconButton(
//                 iconSize: 120,
//                 color: Theme.of(context).cardColor,
//                 onPressed: isRunning ? onPausePressed : onStartPressed,
//                 icon: Icon(isRunning
//                     ? Icons.pause_circle_outline
//                     : Icons.play_circle_outline),
//               ),
//             ),
//           ),
//           Flexible(
//             flex: 1,
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Theme.of(context).cardColor,
//                       borderRadius: BorderRadius.circular(50),
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           '$totalPomodoros',
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.w600,
//                             color: Theme.of(context)
//                                 .textTheme
//                                 .headlineLarge!
//                                 .color,
//                           ),
//                         ),
//                         Text(
//                           '0',
//                           style: TextStyle(
//                             fontSize: 58,
//                             fontWeight: FontWeight.w600,
//                             color: Theme.of(context)
//                                 .textTheme
//                                 .headlineLarge!
//                                 .color,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
