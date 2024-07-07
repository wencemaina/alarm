/* import 'package:alarm/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AlarmApp());
}

class AlarmApp extends StatelessWidget {
  const AlarmApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
 */

import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(MyAlarm());
}

class MyAlarm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alarm App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: {
        '/home': (context) => SplashScreen(),
      },
    );
  }
}
