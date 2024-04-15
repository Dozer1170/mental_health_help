import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:mental_health_help/defaults.dart';
import 'package:mental_health_help/strings.dart';
import 'package:mental_health_help/styles.dart';

class DailyMeditationPractice extends StatefulWidget {
  const DailyMeditationPractice({super.key});

  @override
  State<DailyMeditationPractice> createState() => _DailyMeditationPracticeState();
}

class _DailyMeditationPracticeState extends State<DailyMeditationPractice> {
  final _tts = FlutterTts();
  final Map<Prompt, PromptControllers> promptControllers = {
    mindfulness: PromptControllers(mindfulness),
    deepRelaxation: PromptControllers(deepRelaxation),
    selfObservation: PromptControllers(selfObservation),
    affirmation: PromptControllers(affirmation),
    committedAction: PromptControllers(committedAction),
  };
  bool _isSpeaking = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(dailyPracticeHeader),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: _mainColumn,
          ),
        ),
      ),
    );
  }

  Widget get _mainColumn => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: md),
          Text(dailyPracticeDescription, style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: md),
          ElevatedButton(
            onPressed: _onStartMeditationButtonPressed,
            child: Text(_isSpeaking ? stopMeditationExercise : startMeditationExercise),
          ),
          const SizedBox(height: md),
          // For each pompt, build a text field for the prompt and a text field for the duration
          Column(
            children: promptControllers.entries.map((entry) => buildPromptField(prompt: entry.key)).toList(),
          ),
        ],
      );

  Widget buildPromptField({
    required Prompt prompt,
    int lines = 1,
  }) {
    final controllers = promptControllers[prompt];
    if (controllers == null) {
      throw Exception('No controllers found for $prompt.promptText');
    }

    return Padding(
      padding: lgEdge,
      child: Card(
        child: Padding(
          padding: mdEdge,
          child: Column(
            children: <Widget>[
              Text(prompt.title, style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: md),
              TextField(
                controller: controllers.promptController,
                minLines: lines,
                maxLines: lines,
                decoration: buildInputDecoration('${prompt.title} Voice Prompt'),
              ),
              const SizedBox(height: sm),
              TextField(
                controller: controllers.durationController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Duration',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onStartMeditationButtonPressed() {
    setState(() {
      if (_isSpeaking) {
        _tts.stop();
        _isSpeaking = false;
        return;
      }

      _isSpeaking = true;
      // Speak the prompts one at a time
      promptControllers.forEach((prompt, controllers) async {
        final promptText = controllers.promptController.text;
        final duration = int.tryParse(controllers.durationController.text) ?? 0;
        if (promptText.isNotEmpty && duration > 0) {
          _tts.speak(promptText);
          // Wait for the duration before speaking the next prompt
          await Future.delayed(Duration(seconds: duration));
        }
      });
    });
  }
}

class PromptControllers {
  final TextEditingController promptController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final Prompt prompt;

  PromptControllers(this.prompt) {
    promptController.text = prompt.promptText;
    durationController.text = prompt.duration.toString();
  }
}
