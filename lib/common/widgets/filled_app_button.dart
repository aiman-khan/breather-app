import 'package:breather_app/utils/resource/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FilledAppButton extends StatelessWidget {
  const FilledAppButton({
    required this.text,
    required this.onTap,
    required this.color,
    this.textColor,
    super.key,
    this.width,
    this.height,
    this.fontSize,
  });

  final String text;
  final VoidCallback onTap;
  final Color color;
  final Color? textColor;
  final double? width;
  final double? height;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        minimumSize:
            MaterialStateProperty.all(Size(width ?? 360.w, height ?? 90.h)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
      ),
      child: Text(
        text,
        style: GoogleFonts.notoSans(
          color: textColor ?? R.colors.white,
          fontSize: fontSize ?? 35.sp,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.42.w,
        ),
      ),
    );
  }
}
