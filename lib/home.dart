import 'package:flutter/material.dart';
import 'package:mental_health_help/strings.dart';
import 'package:mental_health_help/styles.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appName),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: lg),
              Text(appPurpose, style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: xl),
              _dailyPracticeButton(context),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dailyPracticeButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.pushNamed(context, '/dailypractice'),
      child: const Text(goToDailyMeditation),
    );
  }
}
