import 'package:breather_app/features/onboarding/presentation/providers/breathing_result_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:breather_app/utils/resource/r.dart';

class BreathingScaleWidget extends ConsumerWidget {
  const BreathingScaleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final score = ref.read(breathingScoreProvider);
    final value = score / 10;

    return SizedBox(
      width: 287.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 287.w,
            height: 27.h,
            decoration: BoxDecoration(
              color: R.colors.greyEDECEC,
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: FractionallySizedBox(
              widthFactor: value,
              alignment: Alignment.centerLeft,
              child: Container(
                decoration: BoxDecoration(
                  color: R.colors.blue42C4FB,
                  borderRadius: BorderRadius.circular(30.r),
                ),
              ),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(10, (i) {
                return Text(
                  '${i + 1}',
                  style: TextStyle(
                    color: i < (value * 10).toInt()
                        ? R.colors.white
                        : R.colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
