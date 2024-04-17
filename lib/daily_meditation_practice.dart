import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:mental_health_help/defaults.dart';
import 'package:mental_health_help/strings.dart';
import 'package:mental_health_help/styles.dart';
import 'package:mental_health_help/widgets/prompt_edit.dart';

class DailyMeditationPractice extends StatefulWidget {
  const DailyMeditationPractice({super.key});

  @override
  State<DailyMeditationPractice> createState() => _DailyMeditationPracticeState();
}

class _DailyMeditationPracticeState extends State<DailyMeditationPractice> {
  bool _isSpeaking = false;
  final _tts = FlutterTts();
  final order = [mindfulness, deepRelaxation, selfObservation, affirmation, committedAction];
  final Map<Prompt, PromptControllers> promptControllers = {
    mindfulness: PromptControllers(mindfulness),
    deepRelaxation: PromptControllers(deepRelaxation),
    selfObservation: PromptControllers(selfObservation),
    affirmation: PromptControllers(affirmation),
    committedAction: PromptControllers(committedAction),
  };

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
            children: [
              for (var prompt in order) PromptEdit(prompt: prompt, controllers: promptControllers[prompt]!, lines: 5),
            ],
          ),
        ],
      );

  Future<void> _onStartMeditationButtonPressed() async {
    setState(() {
      if (_isSpeaking) {
        _tts.stop();
        _isSpeaking = false;
        return;
      }

      _isSpeaking = true;
    });

    if (_isSpeaking) {
      // Speak the prompts one at a time
      for (var prompt in order) {
        final controllers = promptControllers[prompt]!;
        final promptText = controllers.promptController.text;
        final duration = int.tryParse(controllers.durationController.text) ?? 0;
        if (promptText.isNotEmpty && duration > 0) {
          if (!_isSpeaking) {
            break;
          }

          await _tts.speak(promptText);

          if (!_isSpeaking) {
            break;
          }
          // Wait for the duration before speaking the next prompt
          await Future.delayed(Duration(seconds: duration));
        }
      }
    }
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
