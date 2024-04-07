class Defaults {
  static final PromptDefault welcomeDailyPractice = PromptDefault(_welcomeDailyPractice, 0);
  static final PromptDefault deepBreath = PromptDefault(_deepBreath, 0);
  static final PromptDefault mindfulness = PromptDefault(_mindfulness, 0);
  static final PromptDefault deepRelaxation = PromptDefault(_deepRelaxation, 0);
  static final PromptDefault selfObservation = PromptDefault(_selfObservation, 0);
  static final PromptDefault affirmation = PromptDefault(_affirmation, 0);
  static final PromptDefault committedAction = PromptDefault(_committedAction, 0);
  static final PromptDefault congratulations = PromptDefault(_congratulations, 0);

  static const String _welcomeDailyPractice = 'Welcome to your daily practice Eric.';
  static const String _deepBreath = 'Take a deep breath and settle in.';
  static const String _mindfulness =
      'Now we will do some mindfulness. Choose mindful breathing or wise mind meditation.';
  static const String _deepRelaxation =
      'Now we will do deep relaxation. Choose cue-controlled relaxation, band of light, safe-place visualization, or progressive muscle relaxation.';
  static const String _selfObservation =
      'Now we will do self observation. Choose thought defusion, judgement defusion,  or be mindful of emotions without judgement.';
  static const String _affirmation =
      'Now we will do affirmation. Some examples are I am learning every day, I can do this, I have grown so much, I am doing the best I can, I love the people in my life, I love me, or My actions are in line with my values.';
  static const String _committedAction =
      "Select a committed action. Some examples are physical health, read self help, be assertive about a problem, use problem solving, spend quality time with kids, do something you enjoy, use beginner's mind, use radical acceptance, use FLAME, improve your physical space, use REST.";
  static const String _congratulations = 'Well done Eric, you have completed your daily practice. See you tomorrow.';
}

class PromptDefault {
  final String prompt;
  final int duration;

  PromptDefault(this.prompt, this.duration);
}
