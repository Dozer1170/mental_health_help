import 'package:flutter/material.dart';
import 'package:mental_health_help/defaults.dart';

class PromptControllers {
  final TextEditingController promptController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final Prompt prompt;

  PromptControllers(this.prompt) {
    promptController.text = prompt.promptText;
    durationController.text = prompt.duration.toString();
  }
}
