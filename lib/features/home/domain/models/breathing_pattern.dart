enum EmotionState {
  focus,
  anxiety,
  stress,
  mood,
}

class BreathingPattern {
  final String title;
  final int inhaleDuration;
  final int exhaleDuration;
  final int holdDuration;
  final int holdTwoDuration;
  final String description;
  final int cycleCount;
  final String cbtSentence;
  final int cycleDuration;
  final int score;

  BreathingPattern({
    required this.title,
    required this.inhaleDuration,
    required this.exhaleDuration,
    required this.holdDuration,
    required this.holdTwoDuration,
    required this.description,
    required this.cycleCount,
    required this.cbtSentence,
    required this.cycleDuration,
    required this.score,
  });
}

class BreathingPatterns {
  static List<BreathingPattern> focusPatterns = [
    BreathingPattern(
      title: "Single-Point Focus",
      inhaleDuration: 3,
      exhaleDuration: 3,
      holdDuration: 0,
      holdTwoDuration: 0,
      description:
          "10 cycles of Inhale focusing on a single point (3s), Exhale distractions (3s).",
      cycleCount: 10,
      cbtSentence: "Focus sharpens with each breath.",
      cycleDuration: 60,
      score: 10,
    ),
    BreathingPattern(
      title: "Counting Breaths",
      inhaleDuration: 3,
      exhaleDuration: 4,
      holdDuration: 2,
      holdTwoDuration: 0,
      description:
          "20 cycles of Inhale (3s), Hold (2s), Exhale (4s) while counting each cycle up to five.",
      cycleCount: 20,
      cbtSentence: "Counting centers my mind.",
      cycleDuration: 180,
      score: 20,
    ),
    BreathingPattern(
      title: "Visualization Breathing",
      inhaleDuration: 4,
      exhaleDuration: 4,
      holdDuration: 2,
      holdTwoDuration: 0,
      description:
          "30 cycles of Inhale visualizing a goal (4s), Hold (2s), Exhale distractions (4s).",
      cycleCount: 15,
      cbtSentence: "Visualize goals, clear distractions.",
      cycleDuration: 300,
      score: 30,
    ),
  ];

  static List<BreathingPattern> anxietyPatterns = [
    BreathingPattern(
      title: "4-2-4 Breathing",
      inhaleDuration: 4,
      exhaleDuration: 4,
      holdDuration: 2,
      holdTwoDuration: 0,
      description:
          "6 cycles of Inhale (4s), Hold (2s), Exhale (4s). Focus on calmness with each cycle.",
      cycleCount: 6,
      cbtSentence: "Calmness grows with each breath.",
      cycleDuration: 60,
      score: 10,
    ),
    BreathingPattern(
      title: "Box Breathing",
      inhaleDuration: 5,
      exhaleDuration: 5,
      holdDuration: 5,
      holdTwoDuration: 5,
      description:
          "9 cycles of Inhale (5s), Hold (5s), Exhale (5s), Hold (5s). Acknowledge and release anxious thoughts with each exhale.",
      cycleCount: 9,
      cbtSentence: "Release worry with each exhale.",
      cycleDuration: 180,
      score: 20,
    ),
    BreathingPattern(
      title: "Progressive Relaxation",
      inhaleDuration: 4,
      exhaleDuration: 6,
      holdDuration: 2,
      holdTwoDuration: 0,
      description:
          "25 cycles of Inhale (4s) while tensing muscles, Hold (2s), Exhale (6s) while releasing tension. Progress from feet to head.",
      cycleCount: 25,
      cbtSentence: "Relaxing more with every breath.",
      cycleDuration: 300,
      score: 30,
    ),
  ];

  static List<BreathingPattern> stressPatterns = [
    BreathingPattern(
      title: "Quick Coherence",
      inhaleDuration: 5,
      exhaleDuration: 5,
      holdDuration: 0,
      holdTwoDuration: 0,
      description:
          "6 cycles of Even breathing (5s per inhale/exhale) with focus on the heart, imagining stress flowing out.",
      cycleCount: 6,
      cbtSentence: "Breath out stress, breathe in calm.",
      cycleDuration: 60,
      score: 10,
    ),
    BreathingPattern(
      title: "Extended Exhale",
      inhaleDuration: 4,
      exhaleDuration: 8,
      holdDuration: 0,
      holdTwoDuration: 0,
      description:
          "15 cycles of Inhale (4s), Exhale slowly (6-8s). Visualize stress decreasing with longer exhales.",
      cycleCount: 15,
      cbtSentence: "Longer exhales, less stress.",
      cycleDuration: 180,
      score: 20,
    ),
    BreathingPattern(
      title: "Rhythmic Breathing",
      inhaleDuration: 5,
      exhaleDuration: 5,
      holdDuration: 0,
      holdTwoDuration: 0,
      description:
          "30 cycles of Steady inhale (5s), Steady exhale (5s). Visualize a pendulum for balance.",
      cycleCount: 30,
      cbtSentence: "Balance returns with each breath.",
      cycleDuration: 300,
      score: 30,
    ),
  ];

  static List<BreathingPattern> moodPatterns = [
    BreathingPattern(
      title: "Smile Breathing",
      inhaleDuration: 5,
      exhaleDuration: 5,
      holdDuration: 0,
      holdTwoDuration: 0,
      description:
          "6 cycles of Inhale deeply with a smile (4s), Exhale negative emotions (4s). Allow the smile to enhance mood with each cycle.",
      cycleCount: 6,
      cbtSentence: "Smiling enhances my mood.",
      cycleDuration: 60,
      score: 10,
    ),
    BreathingPattern(
      title: "Positive Affirmation",
      inhaleDuration: 4,
      exhaleDuration: 4,
      holdDuration: 2,
      holdTwoDuration: 0,
      description:
          "18 cycles of Inhale positivity (4s), Hold with affirmation (2s), Exhale negativity (4s).",
      cycleCount: 18,
      cbtSentence: "Positivity in, negativity out.",
      cycleDuration: 180,
      score: 20,
    ),
    BreathingPattern(
      title: "Gratitude Breathing",
      inhaleDuration: 6,
      exhaleDuration: 6,
      holdDuration: 3,
      holdTwoDuration: 0,
      description:
          "20 cycles of Inhale gratitude (5s), Hold (3s), Exhale negatives (5s). New positive thought with each breath.",
      cycleCount: 20,
      cbtSentence: "Grateful breaths, joyful heart.",
      cycleDuration: 300,
      score: 30,
    ),
  ];
}
