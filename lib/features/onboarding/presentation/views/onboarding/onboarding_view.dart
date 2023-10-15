import 'package:breather_app/common/extensions/num.dart';
import 'package:breather_app/common/widgets/app_name_widget.dart';
import 'package:breather_app/features/onboarding/presentation/views/onboarding/widgets/onboarding_begin_view.dart';
import 'package:breather_app/features/onboarding/presentation/views/onboarding/widgets/onboarding_summary_view.dart';
import 'package:breather_app/features/onboarding/presentation/views/onboarding/widgets/onboarding_test_view.dart';
import 'package:breather_app/utils/resource/r.dart';
import 'package:breather_app/utils/router/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
              top: 59.h,
              left: 70.w,
              right: 70.w,
              bottom: 173.h,
            ),
            child: Column(
              children: [
                /// [Skip]
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.h,
                      horizontal: 18.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(55.r),
                      border: Border.all(color: R.colors.blue42C4FB),
                    ),
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 23.sp,
                        color: R.colors.black,
                      ),
                    ),
                  ),
                ),

                50.hb,

                /// [App Name]
                const AppNameWidget(),

                23.hb,

                /// [Page view]
                Expanded(
                  child: PageView(
                    controller: pageController,
                    physics: const BouncingScrollPhysics(),
                    onPageChanged: (page) {
                      setState(() {
                        index = page;
                      });
                    },
                    children: [
                      OnboardingBeginView(
                        onTap: () => animate(1),
                      ),
                      OnboardingTestView(
                        onTap: () => animate(2),
                      ),
                      OnboardingSummaryView(
                        onTap: () =>
                            GoRouter.of(context).push(RoutePaths.login),
                      ),
                    ],
                  ),
                ),

                137.hb,

                /// [Progress]
                AnimatedAlign(
                  alignment: index == 0
                      ? Alignment.topLeft
                      : index == 1
                          ? Alignment.topCenter
                          : Alignment.topRight,
                  duration: const Duration(milliseconds: 300),
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
