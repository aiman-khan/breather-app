import 'package:breather_app/common/extensions/num.dart';
import 'package:breather_app/common/widgets/filled_app_button.dart';
import 'package:breather_app/utils/resource/r.dart';
import 'package:breather_app/utils/router/paths.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class OnboardingBeginView extends StatefulWidget {
  const OnboardingBeginView({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  State<OnboardingBeginView> createState() => _OnboardingBeginViewState();
}

class _OnboardingBeginViewState extends State<OnboardingBeginView> {
  bool isBegin = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// [Lottie Animation]
        !isBegin
            ? SizedBox(
                height: 598.h,
                child: Lottie.asset(R.lotties.welcomeAnimation),
              )
            : SizedBox(
                height: 598.h,
                child: CircularCountDownTimer(
                  duration: 4,
                  initialDuration: 0,
                  controller: CountDownController(),
                  width: 524.h,
                  height: 524.h,
                  ringColor: Colors.orange,
                  ringGradient: null,
                  fillColor: Colors.white,
                  fillGradient: null,
                  backgroundColor: Colors.white,
                  backgroundGradient: null,
                  strokeWidth: 24,
                  strokeCap: StrokeCap.round,
                  textStyle: TextStyle(
                    fontSize: 124.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textFormat: CountdownTextFormat.S,
                  isReverse: true,
                  isReverseAnimation: true,
                  isTimerTextShown: true,
                  autoStart: true,
                  onComplete: () {
                    widget.onTap();
                  },
                  onChange: (String timeStamp) {
                    debugPrint('Countdown Changed $timeStamp');
                  },
                  timeFormatterFunction: (defaultFormatterFunction, duration) {
                    if (duration.inSeconds == 0) {
                      return "Start";
                    } else {
                      return Function.apply(
                          defaultFormatterFunction, [duration]);
                    }
                  },
                ),
              ),

        const Spacer(),

        /// [Tag Line]
        Text(
          "Want to begin with a test?",
          style: TextStyle(
            fontSize: 50.sp,
            color: R.colors.black,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),

        const Spacer(),

        /// [Buttons]
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// [Yes]
            FilledAppButton(
              text: 'Yes',
              onTap: () {
                setState(() {
                  isBegin = true;
                });
              },
              textColor: R.colors.white,
              width: 201.w,
              fontSize: 35.sp,
            ),

            95.wb,

            /// [No]
            FilledAppButton(
              text: 'No',
              onTap: () => GoRouter.of(context).push(RoutePaths.login),
              textColor: R.colors.white,
              width: 201.w,
              colors: [
                R.colors.greyC8CDCF,
                R.colors.grey828384,
              ],
            ),
          ],
        ),
      ],
    );
  }
}
