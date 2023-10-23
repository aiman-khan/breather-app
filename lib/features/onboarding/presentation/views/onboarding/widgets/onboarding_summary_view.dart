import 'package:breather_app/common/extensions/num.dart';
import 'package:breather_app/common/widgets/filled_app_button.dart';
import 'package:breather_app/features/onboarding/presentation/providers/breathing_result_provider.dart';
import 'package:breather_app/features/onboarding/presentation/views/onboarding/widgets/breathing_scale_widget.dart';
import 'package:breather_app/utils/resource/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingSummaryView extends ConsumerWidget {
  const OnboardingSummaryView({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final score = ref.watch(breathingScoreProvider);
    final seconds = ref.watch(breathingSecondsProvider);

    String result(int score) {
      String message = '';

      if (score >= 0 && score <= 1) {
        message = 'Average';
      } else if (score >= 2 && score <= 4) {
        message = 'Good';
      } else if (score >= 5 && score <= 9) {
        message = 'Strong';
      } else {
        message = 'Super';
      }

      return message;
    }

    return Column(
      children: [
        /// [Summary]
        Text(
          'SUMMARY',
          style: TextStyle(
            fontSize: 60.sp,
            color: R.colors.black,
            fontWeight: FontWeight.w500,
            letterSpacing: 3.w,
          ),
          textAlign: TextAlign.center,
        ),

        const Spacer(),

        /// [Breathing Score]
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Breathing Score',
              style: TextStyle(
                fontSize: 20.sp,
                color: R.colors.black,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.w,
              ),
              textAlign: TextAlign.center,
            ),
            8.hb,

            /// [Scale]
            const BreathingScaleWidget(),
          ],
        ),

        const Spacer(),

        Text(
          'Congratulations!',
          style: TextStyle(
            fontSize: 64.sp,
            color: R.colors.black,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),

        14.hb,

        RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 45.sp,
              fontWeight: FontWeight.w400,
              color: R.colors.black,
            ),
            children: [
              const TextSpan(text: "You've "),
              TextSpan(
                text: result(score),
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const TextSpan(
                text: " lungs",
              ),
            ],
          ),
        ),

        34.hb,

        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.w400,
              color: R.colors.black,
            ),
            children: [
              const TextSpan(
                  text:
                      "Based on the lung capacity test you took, your score is "),
              TextSpan(
                text: "$score",
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const TextSpan(
                text: " out of ",
              ),
              const TextSpan(
                text: "10",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const TextSpan(
                text: " in ",
              ),
              TextSpan(
                text: "$seconds sec",
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),

        const Spacer(),

        /// [Button]
        /// [Next]
        FilledAppButton(
          text: 'Next',
          onTap: onTap,
          textColor: R.colors.white,
          fontSize: 22.sp,
        ),
      ],
    );
  }
}
