enum BreathingScore {
  notGoodLungs,
  goodLungs,
  strongLungs,
  superLungs;
}

class BreathingResult {
  final int score;
  final BreathingScore message;

  BreathingResult(this.score, this.message);
}

BreathingResult calculateBreathingScore(int seconds) {
  int score = (seconds / 6).floor();

  if (score < 0) {
    score = 0;
  } else if (score > 10) {
    score = 10;
  }

  BreathingScore message;
  if (score >= 0 && score <= 1) {
    message = BreathingScore.notGoodLungs;
  } else if (score >= 2 && score <= 4) {
    message = BreathingScore.goodLungs;
  } else if (score >= 5 && score <= 9) {
    message = BreathingScore.strongLungs;
  } else {
    message = BreathingScore.superLungs;
  }

  return BreathingResult(score, message);
}
