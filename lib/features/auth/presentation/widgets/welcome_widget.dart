import 'package:breather_app/common/widgets/filled_app_button.dart';
import 'package:breather_app/utils/resource/r.dart';
import 'package:breather_app/utils/router/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.blue42C4FB,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(R.images.welcomeBg),
            Positioned(
              top: -134.h,
              child: SizedBox(
                height: 433.h,
                width: 266.h,
                child: Image.asset(R.images.appLogo),
              ),
            ),
            Positioned(
              bottom: 224.h,
              child: Text(
                'Welcome!',
                style: TextStyle(
                  fontSize: 35.sp,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.84.w,
                  color: R.colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Positioned(
              bottom: 100.h,
              child: FilledAppButton(
                text: 'Tap here to start',
                onTap: () =>
                    onTap ?? GoRouter.of(context).push(RoutePaths.home),
                width: 256.5.w,
                height: 45.5.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
