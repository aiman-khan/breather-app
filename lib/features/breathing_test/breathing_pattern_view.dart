import 'dart:async';

import 'package:breather_app/common/extensions/num.dart';
import 'package:breather_app/features/breathing_test/presentation/providers/save_score_provider.dart';
import 'package:breather_app/features/breathing_test/presentation/providers/save_streak_provider.dart';
import 'package:breather_app/features/home/domain/models/breathing_pattern.dart';
import 'package:breather_app/utils/router/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../utils/resource/r.dart';
import '../home/presentation/views/emotional_state/widgets/state_animation.dart';

class BreathingPatternView extends ConsumerStatefulWidget {
  const BreathingPatternView({
    super.key,
    required this.pattern,
    required this.patternName,
  });

  final BreathingPattern pattern;
  final String patternName;

  @override
  ConsumerState<BreathingPatternView> createState() =>
      _BreathingPatternViewState();
}

class _BreathingPatternViewState extends ConsumerState<BreathingPatternView> {
  bool isTextVisible = true;

  int currentIndex = 0;
  int secondsLeft = 6;

  bool showCountdown = false;
  bool showMorningAnimation = false;
  String morningText = 'Breath In';

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 2), (timer) {
      if (secondsLeft > 0) {
        setState(() {
          if ((currentIndex >= 0 && currentIndex <= 2)) {
            secondsLeft = secondsLeft - 2;

            if (secondsLeft != 0) {
              currentIndex += 1;
              isTextVisible = !isTextVisible;
            }

            if (secondsLeft == 1) {
              setState(() {
                showCountdown = true;
              });
            }
          }
        });
      } else {
        timer.cancel();
        showCount();
        setState(() {
          showCountdown = true;
          showMorningAnimation = true;
        });
      }
    });
  }

  var cycles = 0;
  var seconds = 1;

  Future<void> showCount() async {
    var totalCycles = widget.pattern.cycleCount;

    if (cycles < totalCycles) {
      setState(() {
        morningText = 'Breath In';
      });

      await Future.delayed(Duration(seconds: widget.pattern.inhaleDuration),
          () {
        setState(() {
          if (widget.pattern.holdDuration != 0) {
            morningText = 'Hold';
          } else {
            morningText = 'Breath Out';
          }
        });
      });

      if (widget.pattern.holdDuration != 0) {
        await Future.delayed(Duration(seconds: widget.pattern.holdDuration),
            () {
          setState(() {
            morningText = 'Breath Out';
          });
        });
      }

      await Future.delayed(Duration(seconds: widget.pattern.exhaleDuration),
          () {
        setState(() {
          if (widget.pattern.holdTwoDuration != 0) {
            morningText = 'Hold';
          } else {
            cycles++;
            if (cycles == totalCycles) {
              morningText = 'Finished';
            }
          }
        });
      });

      if (widget.pattern.holdTwoDuration != 0) {
        await Future.delayed(Duration(seconds: widget.pattern.holdTwoDuration),
            () {
          setState(() {
            cycles++;
            if (cycles == totalCycles) {
              morningText = 'Finished';
            }
          });
        });
      }

      showCount();
    } else {
      saveScore(widget.pattern.score);
      saveStreak();

      GoRouter.of(context).pushReplacement(RoutePaths.result);
    }
  }

  final texts = [
    'Breathe from your nose',
    'Take a deep breath',
    "Let's get started",
  ];

  Future<void> saveScore(int score) async {
    try {
      await ref.read(saveScoreProvider(score).future);
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future<void> saveStreak() async {
    try {
      await ref.read(saveStreakProvider.future);
    } catch (e) {
      debugPrint('$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFFAFBFD),
                  Color(0xFF6D9FE7),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: Column(
                children: [
                  72.hb,
                  Text(
                    widget.patternName,
                    style: TextStyle(
                      color: R.colors.black,
                      fontSize: 35.7.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    widget.pattern.title,
                    style: TextStyle(
                      color: R.colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    widget.pattern.cbtSentence,
                    style: TextStyle(
                      color: R.colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  59.hb,
                  SizedBox(
                    width: 284.r,
                    height: 284.r,
                    child: showMorningAnimation
                        ? StateAnimation(
                            pattern: widget.pattern,
                          )
                        : Lottie.asset(
                            R.lotties.breathingAnimation,
                          ),
                  ),
                  20.hb,
                  AnimatedOpacity(
                    duration: const Duration(seconds: 2),
                    opacity: isTextVisible ? 1.0 : 0.0,
                    child: Text(
                      showMorningAnimation ? morningText : texts[currentIndex],
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: const Color(0xFF393939),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
