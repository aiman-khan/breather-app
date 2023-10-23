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
                  top: 59.h,
                  left: 70.w,
                  right: 70.w,
                  bottom: 173.h,
                ),
                child: Column(
                  children: [
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

                    // White bars based on index
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (int i = 0; i < 3; i++)
                          Flexible(
                            child: Container(
                              width: 143.w,
                              height: 12.h,
                              margin: EdgeInsets.symmetric(horizontal: 5.w),
                              decoration: BoxDecoration(
                                color: i == index
                                    ? R.colors.blue132D69
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                            ),
                          ),
                      ],
                    ),
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
