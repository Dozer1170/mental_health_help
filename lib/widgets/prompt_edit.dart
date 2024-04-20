import 'package:flutter/material.dart';
import 'package:mental_health_help/defaults.dart';
import 'package:mental_health_help/prompt_controllers.dart';
import 'package:mental_health_help/styles.dart';

class PromptEdit extends StatelessWidget {
  final Prompt prompt;
  final PromptControllers controllers;
  final int lines;

  const PromptEdit({
    super.key,
    required this.prompt,
    required this.controllers,
    this.lines = 1,
  });

  @override
  Widget build(BuildContext context) {
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
}
