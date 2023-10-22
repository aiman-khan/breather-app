import 'package:breather_app/utils/resource/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppNameWidget extends StatelessWidget {
  const AppNameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'BREATHER',
      style: TextStyle(
        fontSize: 50.sp,
        letterSpacing: 6.w,
        color: R.colors.black,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
