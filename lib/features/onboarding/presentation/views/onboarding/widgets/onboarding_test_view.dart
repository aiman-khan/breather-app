import 'dart:async';

import 'package:breather_app/common/widgets/filled_app_button.dart';
import 'package:breather_app/features/onboarding/presentation/providers/breathing_result_provider.dart';
import 'package:breather_app/utils/resource/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingTestView extends ConsumerStatefulWidget {
  const OnboardingTestView({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  ConsumerState<OnboardingTestView> createState() => _OnboardingTestViewState();
}

class _OnboardingTestViewState extends ConsumerState<OnboardingTestView> {
  int seconds = 0;
  int score = 0;

  late Timer timer;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3)).whenComplete(
      () {
        startTimer();
      },
    );
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(milliseconds: 1700), (Timer timer) {
      setState(() {
        seconds++;
        ref.read(breathingSecondsProvider.notifier).state = seconds;

        if (seconds % 5 == 0) {
          score++;
          ref.read(breathingScoreProvider.notifier).state = score;
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// [Lottie Animation]
        SizedBox(
          height: 598.h,
          child: Image.asset(
            R.gifs.breathingTestGif,
          ),
        ),

        const Spacer(),

        /// [Tag Line]
        Text(
          'Assessing the power of your breath',
          style: TextStyle(
            fontSize: 50.sp,
            color: R.colors.black,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),

        const Spacer(),

        /// [Button]
        /// [Next]
        FilledAppButton(
          text: 'Next',
          onTap: widget.onTap,
          color: R.colors.blue42C4FB,
          textColor: R.colors.white,
          width: 250.w,
          height: 63.h,
          fontSize: 22.sp,
        ),
      ],
    );
  }
}
