import 'package:flutter/material.dart';
import 'package:mental_health_help/daily_meditation_practice.dart';
import 'package:mental_health_help/home.dart';
import 'package:mental_health_help/strings.dart';
import 'package:mental_health_help/themes.dart';
import 'package:mental_health_help/transitions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: darkTheme,
      onGenerateRoute: (settings) {
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return routes[settings.name]!(context);
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return buildTransition(
              type: TransitionType.slideUp,
              animation: animation,
              curve: Curves.easeInOutCubicEmphasized,
              child: child,
            );
          },
        );
      },
      home: const Home(),
    );
  }
}

final routes = {
  '/home': (context) => const Home(),
  '/dailypractice': (context) => const DailyMeditationPractice(),
};
