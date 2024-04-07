import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final tts = FlutterTts();
  int _counter = 0;

  Future<void> _incrementCounter() async {
    await tts.speak("Hello World");
    setState(() {
      _counter++;
    });
  }

// say "Welcome to your daily practice Eric." -v $VOICE
// say "Take a deep breath and settle in." -v $VOICE
// sleep 16

// say "Now we will do some mindfulness. Choose mindful breathing or wise mind meditation." -v $VOICE
// sleep 180

// say "Now we will do deep relaxation. Choose cue-controlled relaxation, band of light, safe-place visualization, or progressive muscle relaxation." -v $VOICE
// sleep 180

// say "Now we will do self observation. Choose thought defusion, judgement defusion,  or be mindful of emotions without judgement." -v $VOICE
// sleep 180

// say "Now we will do affirmation. Some examples are I am learning every day, I can do this, I have grown so much, I am doing the best I can, I love the people in my life, I love me, or My actions are in line with my values." -v $VOICE
// sleep 180

// say "Select a committed action. Some examples are physical health, read self help, be assertive about a problem, use problem solving, spend quality time with kids, do something you enjoy, use beginner's mind, use radical acceptance, use FLAME, improve your physical space, use REST." -v $VOICE
// sleep 20

// say "Well done Eric, you have completed your daily practice. See you tomorrow." -v $VOICE

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildTextField('First Name'),
            buildTextField('Last Name'),
            buildTextField('Mindfulness Meditation'),
            buildTextField('Deep Relaxation'),
            buildTextField('Committed Action'),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String labelText) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          labelText,
        ),
        TextField(
          decoration: InputDecoration(
            labelText: labelText,
          ),
        ),
      ],
    );
  }
}
