import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_breather_app/utils/resource/r.dart';

class BreathingScaleWidget extends StatelessWidget {
  const BreathingScaleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          children: [
            Container(
              width: 576.w,
              height: 57.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                color: R.colors.greyC8CDCF,
              ),
            ),
            Container(
              width: 391.w,
              height: 57.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                color: R.colors.blue42C4FB,
                boxShadow: [
                  BoxShadow(
                    color: R.colors.blue42C4FB,
                  )
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 10.h,
          ),
          child: Row(
            children: List.generate(
              10,
              (index) {
                return Padding(
                  padding: EdgeInsets.only(right: 38.w),
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                      color: R.colors.white,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
