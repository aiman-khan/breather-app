import 'package:go_router/go_router.dart';
import 'package:my_breather_app/common/extensions/num.dart';
import 'package:my_breather_app/common/widgets/filled_app_button.dart';
import 'package:my_breather_app/utils/resource/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:my_breather_app/utils/router/paths.dart';

class OnboardingTestView extends StatelessWidget {
  const OnboardingTestView({super.key});

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

                23.hb,

                /// [Lottie Animation]
                SizedBox(
                  height: 598.h,
                  child: Lottie.network(
                      "https://lottie.host/25891627-18a0-41b3-87a4-eec9225fbc71/ZtWjGoJ6Na.json"),
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
                  onTap: () =>
                      GoRouter.of(context).push(RoutePaths.onboardingSummary),
                  color: R.colors.blue42C4FB,
                  textColor: R.colors.white,
                  width: 201.w,
                ),

                const Spacer(),

                Align(
                  alignment: Alignment.center,
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
