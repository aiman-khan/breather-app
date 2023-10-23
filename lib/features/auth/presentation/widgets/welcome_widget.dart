import 'package:breather_app/common/extensions/num.dart';
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
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 96.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome!',
                style: TextStyle(
                  fontSize: 70.sp,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.84.w,
                ),
                textAlign: TextAlign.center,
              ),
              475.hb,
              FilledAppButton(
                text: 'Start here',
                onTap: () =>
                    onTap ?? GoRouter.of(context).push(RoutePaths.home),
                width: 480.w,
                height: 90.h,
                fontSize: 35.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
