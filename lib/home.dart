import 'package:flutter/material.dart';
import 'package:mental_health_help/daily_meditation_practice.dart';
import 'package:mental_health_help/strings.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appName),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DailyMeditationPractice()),
            );
          },
          child: const Text(goToDailyMeditation),
        ),
      ),
    );
  }
}
