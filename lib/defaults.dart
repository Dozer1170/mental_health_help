final Prompt welcomeDailyPractice = Prompt(_welcomeDailyPracticeTitle, _welcomeDailyPractice, 0);
final Prompt deepBreath = Prompt(_deepBreathTitle, _deepBreath, 15);
final Prompt mindfulness = Prompt(_mindfulnessTitle, _mindfulness, 180);
final Prompt deepRelaxation = Prompt(_deepRelaxationTitle, _deepRelaxation, 180);
final Prompt selfObservation = Prompt(_selfObservationTitle, _selfObservation, 180);
final Prompt affirmation = Prompt(_affirmationTitle, _affirmation, 180);
final Prompt committedAction = Prompt(_committedActionTitle, _committedAction, 20);
final Prompt congratulations = Prompt(_congratulationsTitle, _congratulations, 0);

const String _welcomeDailyPractice = 'Welcome to your daily practice Eric.';
const String _welcomeDailyPracticeTitle = 'Welcome';

const String _deepBreath = 'Take a deep breath and settle in.';
const String _deepBreathTitle = 'Deep Breath';

const String _mindfulness = 'Now we will do some mindfulness. Choose mindful breathing or wise mind meditation.';
const String _mindfulnessTitle = 'Mindfulness';

const String _deepRelaxation =
    'Now we will do deep relaxation. Choose cue-controlled relaxation, band of light, safe-place visualization, or progressive muscle relaxation.';
const String _deepRelaxationTitle = 'Deep Relaxation';

const String _selfObservation =
    'Now we will do self observation. Choose thought defusion, judgement defusion,  or be mindful of emotions without judgement.';
const String _selfObservationTitle = 'Self Observation';

const String _affirmation =
    'Now we will do affirmation. Some examples are I am learning every day, I can do this, I have grown so much, I am doing the best I can, I love the people in my life, I love me, or My actions are in line with my values.';
const String _affirmationTitle = 'Affirmation';

const String _committedAction =
    "Select a committed action. Some examples are physical health, read self help, be assertive about a problem, use problem solving, spend quality time with kids, do something you enjoy, use beginner's mind, use radical acceptance, use FLAME, improve your physical space, use REST.";
const String _committedActionTitle = "Committed Action";

const String _congratulations = 'Well done 1, you have completed your daily practice. See you tomorrow.';
const String _congratulationsTitle = 'Congratulations';

class Prompt {
  final String title;
  final String promptText;
  final int duration;

  Prompt(this.title, this.promptText, this.duration);

  @override
  int get hashCode => title.hashCode ^ promptText.hashCode ^ duration.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Prompt &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          promptText == other.promptText &&
          duration == other.duration;
}
