import 'package:breather_app/common/extensions/num.dart';
import 'package:breather_app/common/widgets/filled_app_button.dart';
import 'package:breather_app/utils/resource/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SuccessMessageWidget extends StatelessWidget {
  const SuccessMessageWidget({
    super.key,
    required this.message,
    required this.onDone,
  });

  final String message;
  final VoidCallback onDone;

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
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 27.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(R.lotties.success),
                  Text(
                    message,
                    style: TextStyle(
                      fontSize: 19.7.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  164.hb,
                  FilledAppButton(
                    text: 'Done',
                    onTap: onDone,
                    width: 125.w,
                    height: 43.h,
                    fontSize: 16.sp,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
