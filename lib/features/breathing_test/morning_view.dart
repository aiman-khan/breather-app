import 'dart:async';

import 'package:breather_app/common/extensions/num.dart';
import 'package:breather_app/features/breathing_test/breathing_pattern_view.dart';
import 'package:breather_app/features/breathing_test/presentation/views/widgets/ring_animation.dart';
import 'package:breather_app/features/home/domain/models/breathing_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../utils/resource/r.dart';

class MorningView extends StatefulWidget {
  const MorningView({
    super.key,
    required this.pattern,
    required this.patternName,
  });

  final BreathingPattern pattern;
  final String patternName;

  @override
  State<MorningView> createState() => _MorningViewState();
}

class _MorningViewState extends State<MorningView> {
  bool isTextVisible = true;

  int currentIndex = 0;
  int secondsLeft = 3;
  String message = 'Relax and get comfortable';

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsLeft > 0) {
        setState(() {
          if ((currentIndex >= 0 && currentIndex <= 2)) {
            secondsLeft--;

            if (secondsLeft == 2) {
              message = 'Focus on your breathing';
            }

            if (secondsLeft == 1) {
              message = 'Get Ready!';
            }

            if (secondsLeft != 0) {
              currentIndex = 3 - secondsLeft;
              isTextVisible = !isTextVisible;
            }
          }
        });
      } else {
        timer.cancel();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return BreathingPatternView(
                pattern: widget.pattern,
                patternName: widget.patternName,
              );
            },
          ),
        );
      }
    });
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
                  Color(0xFF639FDF),
                  Color(0xFF0D0626),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                72.hb,
                Text(
                  widget.patternName,
                  style: TextStyle(
                    color: R.colors.white,
                    fontSize: 35.7.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  widget.pattern.title,
                  style: TextStyle(
                    color: R.colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  widget.pattern.cbtSentence,
                  style: TextStyle(
                    color: R.colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                59.hb,
                const RingAnimation(),
                71.85.hb,
                AnimatedOpacity(
                  duration: const Duration(seconds: 1),
                  opacity: isTextVisible ? 1.0 : 0.0,
                  child: Text(
                    message,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: R.colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                62.7.hb,
                InkWell(
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  child: Container(
                    width: 120.w,
                    height: 52.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26.4.r),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white,
                          Color(0xFF238CFF),
                        ],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.stop,
                          color: R.colors.black,
                          size: 30.r,
                        ),
                        5.4.wb,
                        Text(
                          'Stop',
                          style: TextStyle(
                            color: R.colors.black,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
