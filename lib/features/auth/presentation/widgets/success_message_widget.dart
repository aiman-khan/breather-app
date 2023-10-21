import 'package:breather_app/common/extensions/num.dart';
import 'package:breather_app/common/widgets/filled_app_button.dart';
import 'package:breather_app/utils/resource/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 94.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                message,
                style: TextStyle(
                  fontSize: 38.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.9.w,
                ),
                textAlign: TextAlign.center,
              ),
              382.hb,
              FilledAppButton(
                text: 'Done',
                onTap: onDone,
                color: R.colors.blue42C4FB,
                width: 194.w,
                height: 62.h,
                fontSize: 25.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
