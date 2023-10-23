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
        fontSize: 35.27.sp,
        color: R.colors.blue173777,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
