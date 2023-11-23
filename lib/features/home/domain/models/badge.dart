import 'package:breather_app/utils/resource/r.dart';

enum PerformanceBadge {
  oneMonth,
  screenSoother,
  serenitySeeker,
  serenityStrike,
  stressShield,
  stressSlayer,
  tranquil,
  tripleCalm,
  tripleCheer,
  tripleClarity,
  wellnessWarrior,
  zenith;

  String get earnedImg {
    if (this == PerformanceBadge.oneMonth) {
      return R.images.oneMonth;
    } else if (this == PerformanceBadge.screenSoother) {
      return R.images.screenSoother;
    } else if (this == PerformanceBadge.serenitySeeker) {
      return R.images.serenitySeeker;
    } else if (this == PerformanceBadge.serenityStrike) {
      return R.images.serenityStrike;
    } else if (this == PerformanceBadge.stressShield) {
      return R.images.stressShield;
    } else if (this == PerformanceBadge.stressSlayer) {
      return R.images.stressSlayer;
    } else if (this == PerformanceBadge.tranquil) {
      return R.images.tranquil;
    } else if (this == PerformanceBadge.tripleCalm) {
      return R.images.tripleCalm;
    } else if (this == PerformanceBadge.tripleCheer) {
      return R.images.tripleCheer;
    } else if (this == PerformanceBadge.wellnessWarrior) {
      return R.images.wellnessWarrior;
    } else if (this == PerformanceBadge.tripleClarity) {
      return R.images.tripleClarity;
    } else {
      return R.images.zenith;
    }
  }

  String get notEarnedImg {
    if (this == PerformanceBadge.oneMonth) {
      return R.images.oneMonthBw;
    } else if (this == PerformanceBadge.screenSoother) {
      return R.images.screenSootherBw;
    } else if (this == PerformanceBadge.serenitySeeker) {
      return R.images.serenitySeekerBw;
    } else if (this == PerformanceBadge.serenityStrike) {
      return R.images.serenityStrikeBw;
    } else if (this == PerformanceBadge.stressShield) {
      return R.images.stressShieldBw;
    } else if (this == PerformanceBadge.stressSlayer) {
      return R.images.stressSlayerBg;
    } else if (this == PerformanceBadge.tranquil) {
      return R.images.tranquilBw;
    } else if (this == PerformanceBadge.tripleCalm) {
      return R.images.tripleCalmBw;
    } else if (this == PerformanceBadge.tripleCheer) {
      return R.images.tripleCheerBw;
    } else if (this == PerformanceBadge.wellnessWarrior) {
      return R.images.wellnessWarriorBw;
    } else if (this == PerformanceBadge.tripleClarity) {
      return R.images.tripleClarityBw;
    } else {
      return R.images.zenithBw;
    }
  }
}
