import 'package:breather_app/utils/resource/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FilledAppButton extends StatelessWidget {
  const FilledAppButton({
    required this.text,
    required this.onTap,
    this.colors,
    this.textColor,
    super.key,
    this.width,
    this.height,
    this.fontSize,
  });

  final String text;
  final VoidCallback onTap;
  final List<Color>? colors;
  final Color? textColor;
  final double? width;
  final double? height;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 83.h,
        width: width ?? 201.w,
        alignment: Alignment.center,
        constraints: BoxConstraints(minWidth: width ?? 201.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.r),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: colors ??
                [
                  R.colors.blue224F96,
                  R.colors.blue132D69,
                ],
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            color: textColor ?? R.colors.white,
            fontSize: fontSize ?? 13.22.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
