import 'package:my_breather_app/common/extensions/num.dart';
import 'package:my_breather_app/common/widgets/filled_app_button.dart';
import 'package:my_breather_app/utils/resource/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class OnboardingBeginView extends StatelessWidget {
  const OnboardingBeginView({super.key});

  void _next() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 157.h),
        child: Center(
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

              101.hb,

              /// [Tag Line]
              Text(
                "We're happy\nYou are here",
                style: TextStyle(
                  fontSize: 50.sp,
                  color: R.colors.black,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),

              122.hb,

              /// [Let's go Button]
              FilledAppButton(
                text: "Let's go",
                onTap: _next,
                color: R.colors.blue42C4FB,
                textColor: R.colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
