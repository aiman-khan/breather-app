import 'package:breather_app/common/extensions/num.dart';
import 'package:breather_app/common/widgets/filled_app_button.dart';
import 'package:breather_app/utils/resource/r.dart';
import 'package:breather_app/utils/router/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class OnboardingBeginView extends StatelessWidget {
  const OnboardingBeginView({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// [Lottie Animation]
        SizedBox(
          height: 598.h,
          child: Lottie.network(
              "https://lottie.host/25891627-18a0-41b3-87a4-eec9225fbc71/ZtWjGoJ6Na.json"),
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
              onTap: onTap,
              color: R.colors.blue42C4FB,
              textColor: R.colors.white,
              width: 201.w,
            ),

            95.wb,

            /// [No]
            FilledAppButton(
              text: 'No',
              onTap: () => GoRouter.of(context).push(RoutePaths.login),
              color: R.colors.greyC8CDCF,
              textColor: R.colors.white,
              width: 201.w,
            ),
          ],
        ),
      ],
    );
  }
}
