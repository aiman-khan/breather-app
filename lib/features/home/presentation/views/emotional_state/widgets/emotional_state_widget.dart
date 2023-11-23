import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:breather_app/utils/resource/r.dart';

class EmotionalStateWidget extends StatelessWidget {
  const EmotionalStateWidget({
    super.key,
    required this.colors,
    required this.title,
    this.textColor,
    required this.onTap,
  });

  final String title;
  final List<Color> colors;
  final Color? textColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55.h,
        width: 198.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.6.r),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: colors,
          ),
        ),
        child: SizedBox(
          width: 166.w,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.sp,
              color: textColor ?? R.colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
