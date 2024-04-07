import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:mental_health_help/styles.dart';

class DailyMeditationPractice extends StatefulWidget {
  const DailyMeditationPractice({super.key, required this.title});

  final String title;

  @override
  State<DailyMeditationPractice> createState() => _DailyMeditationPracticeState();
}

class _DailyMeditationPracticeState extends State<DailyMeditationPractice> {
  final tts = FlutterTts();
  //TODO use defaults
  final Map<String, PromptControllers> meditationInfoMap = {
    'First Name': PromptControllers(
      promptController: TextEditingController(),
      durationController: TextEditingController(),
    ),
    'Mindfulness Meditation': PromptControllers(
      promptController: TextEditingController(),
      durationController: TextEditingController(),
    ),
    'Deep Relaxation': PromptControllers(
      promptController: TextEditingController(),
      durationController: TextEditingController(),
    ),
    'Self Observation': PromptControllers(
      promptController: TextEditingController(),
      durationController: TextEditingController(),
    ),
    'Committed Action': PromptControllers(
      promptController: TextEditingController(),
      durationController: TextEditingController(),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //TODO use defaults
            buildTextField(labelText: 'First Name', duration: 2),
            buildTextField(labelText: 'Mindfulness Meditation', lines: 5, duration: 180),
            buildTextField(labelText: 'Deep Relaxation', lines: 5, duration: 180),
            buildTextField(labelText: 'Self Observation', lines: 5, duration: 180),
            buildTextField(labelText: 'Committed Action', lines: 5, duration: 20),
          ],
        ),
      ),
    );
  }

  Widget buildTextField({
    required String labelText,
    required int duration,
    String? defaultText,
    int lines = 1,
  }) {
    final controllers = meditationInfoMap[labelText];
    if (controllers == null) {
      throw Exception('No controllers found for $labelText');
    }

    return Padding(
      padding: mdEdge,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(labelText, style: labelTextStyle),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controllers.promptController,
                  minLines: lines,
                  maxLines: lines,
                  decoration: buildInputDecoration(labelText),
                ),
              ),
              const SizedBox(width: md),
              Expanded(
                child: TextField(
                  decoration: buildInputDecoration('Duration'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PromptControllers {
  final TextEditingController promptController;
  final TextEditingController durationController;

  PromptControllers({
    required this.promptController,
    required this.durationController,
  });
}
