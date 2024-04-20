import 'package:flutter/material.dart';
import 'package:mental_health_help/daily_meditation_practice.dart';
import 'package:mental_health_help/strings.dart';
import 'package:mental_health_help/transitions.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appName),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _dailyPracticeButton(context),
          ],
        ),
      ),
    );
  }

  Widget _dailyPracticeButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _pushDailyPractice(context),
      child: const Text(goToDailyMeditation),
    );
  }

  void _pushDailyPractice(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const DailyMeditationPractice(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return buildTransition(
            type: TransitionType.slideUp,
            animation: animation,
            curve: Curves.easeInOutCirc,
            child: child,
          );
        },
      ),
    );
  }
}
