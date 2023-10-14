import 'package:go_router/go_router.dart';
import 'package:my_breather_app/common/extensions/num.dart';
import 'package:my_breather_app/common/widgets/filled_app_button.dart';
import 'package:my_breather_app/features/onboarding/presentation/views/onboarding/widgets/breathing_scale_widget.dart';
import 'package:my_breather_app/utils/resource/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_breather_app/utils/router/paths.dart';

class OnboardingSummaryView extends StatelessWidget {
  const OnboardingSummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
              top: 157.h,
              left: 50.w,
              right: 50.w,
              bottom: 173.h,
            ),
            child: Column(
              children: [
                /// [App Name]
                Text(
                  'BREATHER',
                  style: GoogleFonts.hurricane(
                    fontSize: 50.sp,
                    letterSpacing: 6.w,
                    color: R.colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                39.hb,

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
                    children: const [
                      TextSpan(text: "You've "),
                      TextSpan(
                        text: "strong",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
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
                    children: const [
                      TextSpan(
                          text:
                              "Based on the lung capacity test, you took your score is "),
                      TextSpan(
                        text: "7",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: " out of ",
                      ),
                      TextSpan(
                        text: "10",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: " in ",
                      ),
                      TextSpan(
                        text: "20sec",
                        style: TextStyle(
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
                  onTap: () =>
                      GoRouter.of(context).push(RoutePaths.onboardingSummary),
                  color: R.colors.blue42C4FB,
                  textColor: R.colors.white,
                  width: 189.w,
                ),

                const Spacer(),

                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 143.w,
                    height: 8.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: R.colors.blue42C4FB,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyScreens(),
    );
  }
}

class MyScreens extends StatelessWidget {
  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: [
          ScreenOne(),
          ScreenTwo(),
          ScreenThree(),
        ],
      ),
    );
  }
}

class ScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.blue,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: MyContainer(),
          ),
        ],
      ),
    );
  }
}

class ScreenTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.green,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: MyContainer(),
          ),
        ],
      ),
    );
  }
}

class ScreenThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.orange,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: MyContainer(),
          ),
        ],
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 2,
      color: Colors.red,
    );
  }
}
