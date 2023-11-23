import 'package:breather_app/features/home/domain/models/breathing_pattern.dart';
import 'package:breather_app/utils/resource/r.dart';
import 'package:flutter/material.dart';

enum EmotionalState {
  focus,
  anxiety,
  stress,
  mood;

  String get name {
    if (this == focus) {
      return 'Focus';
    } else if (this == anxiety) {
      return 'Anxiety';
    } else if (this == stress) {
      return 'Stress';
    } else {
      return 'Mood';
    }
  }

  List<BreathingPattern> get pattern {
    if (this == focus) {
      return BreathingPatterns.focusPatterns;
    } else if (this == anxiety) {
      return BreathingPatterns.anxietyPatterns;
    } else if (this == stress) {
      return BreathingPatterns.stressPatterns;
    } else {
      return BreathingPatterns.moodPatterns;
    }
  }

  List<Color> get colors {
    if (this == focus) {
      return [
        R.colors.white,
        R.colors.whiteC3C3C3,
      ];
    } else if (this == anxiety) {
      return const [
        Color(0xFF62B1FF),
        Color(0xFF3371C5),
      ];
    } else if (this == stress) {
      return [
        const Color(0xFF366FC8),
        const Color(0xFF1E3A7B),
      ];
    } else {
      return [
        const Color(0xFF1C4382),
        const Color(0xFF091C46),
      ];
    }
  }
}
