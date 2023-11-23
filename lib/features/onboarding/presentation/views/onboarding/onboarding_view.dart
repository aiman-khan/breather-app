import 'package:breather_app/common/extensions/num.dart';
import 'package:breather_app/features/onboarding/presentation/views/onboarding/widgets/timer_circle_widget.dart';
import 'package:breather_app/utils/resource/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int index = 0;

  late final PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void animate(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  R.colors.whiteFDFDFE,
                  R.colors.blue669BE7,
                ],
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 56.h,
                  left: 38.w,
                  right: 38.w,
                ),
                child: Column(
                  children: [
                    Text(
                      'Hold &\nbreathe',
                      style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w700,
                        color: R.colors.grey4F4F4F,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    36.69.hb,
                    Text(
                      'Lungs Capacity Test',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    4.hb,
                    SizedBox(
                      width: 264.w,
                      child: Text(
                        "This test will help measure your lung's capacity and endurance. It's a simple breathing exercise where you'll be asked to hold your breath.",
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: R.colors.grey4F4F4F,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    59.3.hb,
                    const TimerCircleWidget(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
