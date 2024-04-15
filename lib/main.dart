import 'package:flutter/material.dart';
import 'package:mental_health_help/daily_meditation_practice.dart';
import 'package:mental_health_help/strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DailyMeditationPractice(),
    );
  }
}
