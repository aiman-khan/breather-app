import 'package:breather_app/common/widgets/app_name_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:breather_app/common/extensions/num.dart';
import 'package:breather_app/common/widgets/filled_app_button.dart';
import 'package:breather_app/utils/resource/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:breather_app/utils/router/paths.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

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
                padding: EdgeInsets.only(top: 37.h, left: 50.w, right: 50.w),
                child: Column(
                  children: [
                    /// [App Name]
                    const AppNameWidget(),

                    23.hb,

                    /// [Lottie Animation]
                    SizedBox(
                      height: 243.h,
                      child: Lottie.asset(
                        R.lotties.welcomeAnimation,
                      ),
                    ),

                    56.68.hb,

                    /// [Tag Line]
                    Text(
                      "We're happy\nYou are here",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: R.colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    122.hb,

                    /// [Let's go Button]
                    FilledAppButton(
                      text: "Let's start",
                      width: 175.w,
                      height: 47.h,
                      onTap: () =>
                          GoRouter.of(context).push(RoutePaths.onboarding),
                      textColor: R.colors.white,
                      fontSize: 13.22.sp,
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
