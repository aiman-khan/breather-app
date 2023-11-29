import 'package:breather_app/common/extensions/num.dart';
import 'package:breather_app/common/widgets/filled_app_button.dart';
import 'package:breather_app/utils/resource/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class TimerSuccessDialog extends StatelessWidget {
  const TimerSuccessDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 32.h,
            horizontal: 24.w,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Congratulations!',
                style: TextStyle(
                  color: R.colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              8.hb,
              Text(
                'Your timer has been set',
                style: TextStyle(
                  color: R.colors.black,
                  fontSize: 16.sp,
                ),
              ),
              12.hb,
              FilledAppButton(
                text: 'Done',
                width: 111.w,
                height: 42.h,
                colors: const [
                  Color(0xff2D579C),
                  Color(0xff163573),
                ],
                onTap: () => GoRouter.of(context).pop(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
