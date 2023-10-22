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
        height: height ?? 103.h,
        width: width ?? 382.w,
        alignment: Alignment.center,
        constraints: BoxConstraints(minWidth: width ?? 383.w),
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
            fontSize: fontSize ?? 50.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
    // return FilledButton(
    //   onPressed: onTap,
    //   style: ButtonStyle(
    //     backgroundColor: MaterialStateProperty.all(color),
    //     minimumSize:
    //         MaterialStateProperty.all(Size(width ?? 360.w, height ?? 90.h)),
    //     shape: MaterialStateProperty.all(
    //       RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(20.r),
    //       ),
    //     ),
    //   ),
    //   child: Text(
    //     text,
    //     style: GoogleFonts.notoSans(
    //       color: textColor ?? R.colors.white,
    //       fontSize: fontSize ?? 35.sp,
    //       fontWeight: FontWeight.w600,
    //       letterSpacing: 0.42.w,
    //     ),
    //   ),
    // );
  }
}
